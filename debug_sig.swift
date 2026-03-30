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
        print("✅ MATCH FOUND! \(label): \(message)")
    } else {
        print("❌ \(label): \(b64)")
    }
}

print("Testing variants...")
test(message: "\(timestamp)\(apiKey)", label: "timestamp + apiKey")
test(message: "\(apiKey)\(timestamp)", label: "apiKey + timestamp")
test(message: "\(apiKey)\(secretKey)\(timestamp)", label: "apiKey + secretKey + timestamp")
test(message: "\(timestamp)\(apiKey)\(secretKey)", label: "timestamp + apiKey + secretKey")
test(message: "CourseList\(timestamp)\(apiKey)", label: "CourseList + timestamp + apiKey")
test(message: "CourseList/\(timestamp)\(apiKey)", label: "CourseList/ + timestamp + apiKey")
test(message: "/rest/action/CourseList/\(timestamp)\(apiKey)", label: "Full path + timestamp + apiKey")
