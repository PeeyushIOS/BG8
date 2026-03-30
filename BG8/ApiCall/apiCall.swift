//
//  apiCall.swift
//  BG8
//
//  Created by Mac HD on 16/07/2025.
//

import Foundation
import Network
import CryptoKit

let IGOLF_API_KEY = "Oqt-mW0LBMYO-SI"
let IGOLF_SECRET_KEY = "cca6_dw-pQ__JCtsH4q6ISpIbHM-ch"

var baseUrl = "https://api-connect.igolf.com/rest/action/"

struct HTTPClient {
    
    
    /// Offline-first API request with automatic caching
    static func request<T: Codable, U: Codable>(
        endPoint: String,
        method: HTTPMethod = .GET,
        body: T? = nil,
        responseType: U.Type
    ) async throws -> U {

//        let cacheKey = cacheFileName(for: endPoint)
        
        // ✅ 1. Agar internet nahi hai → cache se load karo
//        if !NetworkManager.shared.isConnected {
//            if let cached: U = OfflineCache.load(U.self, forKey: cacheKey) {
//                print("📦 Loaded from cache: \(cacheKey)")
//                return cached
//            } else {
//                throw URLError(.notConnectedToInternet)
//            }
//        }
        
        // ✅ 2. Internet hai → API call karo
        guard let url = URL(string: "\(baseUrl)\(endPoint)") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let token = UserSessionManager.shared.token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }


        let (data, response) = try await URLSession.shared.data(for: request)
        if let jsonString = String(data: data, encoding: .utf8) {
            print("📦 Raw JSON Response:", jsonString)
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        if !(200...299).contains(httpResponse.statusCode) {
            if let apiError = try? JSONDecoder().decode(APIErrorResponse.self, from: data) {
//               let message = apiError.message {
                if apiError.metadata?.errorType == "session_expired" {
                         print("⚠️ Session expired. Logging out user.")
                    await MainActor.run {
                        UserSessionManager.shared.clearSession()
                        NotificationCenter.default.post(name: .sessionExpired, object: nil)
                          }
                     }
                throw NSError(
                    domain: "API",
                    code: apiError.statusCode ?? httpResponse.statusCode,
                    userInfo: [NSLocalizedDescriptionKey: apiError.message ?? "Unknown server error"]
                )
            } else {
                throw NSError(
                    domain: "API",
                    code: httpResponse.statusCode,
                    userInfo: [NSLocalizedDescriptionKey: "Unknown server error"]
                )
            }
        }

        let decoded = try JSONDecoder().decode(responseType, from: data)

        // ✅ 3. Cache me save karo
//        OfflineCache.save(decoded, forKey: cacheKey)
//        print("💾 Saved to cache: \(cacheKey)")
        
        return decoded
    }
    
    /// Cache file ka naam safe banane ke liye
    private static func cacheFileName(for endpoint: String) -> String {
        return endpoint.replacingOccurrences(of: "/", with: "_")
                        .replacingOccurrences(of: "?", with: "_")
                        .replacingOccurrences(of: "&", with: "_")
    }
}

enum HTTPMethod: String {
    case GET, POST, PUT, PATCH, DELETE
}

struct APIErrorResponse: Codable {
    let success: Bool?
    let message: String?
    let statusCode: Int?
    let metadata: Metadata?
    
    struct Metadata: Codable {
        let errorType: String?
    }
}

class AppState: ObservableObject {
    @Published var isLoggedIn = true
}

extension Notification.Name {
    static let sessionExpired = Notification.Name("sessionExpired")
    static let signIn = Notification.Name("signIn")
    static let logout = Notification.Name("logout")
}

struct IGolfSignatureHelper {
    static func generateSignedPath(for endpoint: String) -> String {
        let timestamp = getCurrentTimestamp()
        let pathPrefix = "\(endpoint)/\(IGOLF_API_KEY)/1.1/2.0/HmacSHA256"
        let message = "\(pathPrefix)/\(timestamp)/JSON"
        let signature = generateSignature(message: message)
        
        // Format: {Endpoint}/{APIKey}/1.1/2.0/HmacSHA256/{Signature}/{Timestamp}/JSON
        return "\(pathPrefix)/\(signature)/\(timestamp)/JSON"
    }
    
    private static func getCurrentTimestamp() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMddHHmmss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let dateString = formatter.string(from: Date())
        return "\(dateString)+0000"
    }
    
    private static func generateSignature(message: String) -> String {
        let key = SymmetricKey(data: Data(IGOLF_SECRET_KEY.utf8))
        let signature = HMAC<SHA256>.authenticationCode(for: Data(message.utf8), using: key)
        
        return Data(signature).base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}



