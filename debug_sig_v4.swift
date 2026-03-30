import Foundation
import CryptoKit

let apiKey = "Oqt-mW0LBMYO-SI"
let secretKey = "cca6_dw-pQ__JCtsH4q6ISpIbHM-ch"
let timestamp = "260310161247+0000"
let expectedSignature = "w0eadDrVks9MUsHWYeQKmMMtSd_9CeM5C-OAlxKu-ic"

func b64url(_ data: Data) -> String {
    return data.base64EncodedString()
        .replacingOccurrences(of: "+", with: "-")
        .replacingOccurrences(of: "/", with: "_")
        .replacingOccurrences(of: "=", with: "")
}

func test(message: String, label: String) {
    let key = SymmetricKey(data: Data(secretKey.utf8))
    let signature = HMAC<SHA256>.authenticationCode(for: Data(message.utf8), using: key)
    let b64 = b64url(Data(signature))
    if b64 == expectedSignature {
        print("✅ MATCH FOUND! \(label)")
        print("Message: \(message)")
        exit(0)
    }
}

print("Testing path variants...")
test(message: "CourseList/\(apiKey)/1.1/2.0/HmacSHA256/\(timestamp)", label: "Full prefix with ts")
test(message: "CourseList/\(apiKey)/1.1/2.0/HmacSHA256/\(timestamp)/JSON", label: "Full prefix with ts and JSON")
test(message: "CourseList/\(apiKey)/1.1/2.0/HmacSHA256\(timestamp)", label: "Full prefix no slash")

print("Done.")
