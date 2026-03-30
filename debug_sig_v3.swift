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

let parts = [
    "CourseList",
    apiKey,
    "1.1",
    "2.0",
    "JSON",
    timestamp
]

func permutations<T>(_ a: [T]) -> [[T]] {
    if a.count == 0 { return [[]] }
    var res: [[T]] = []
    for i in 0..<a.count {
        var b = a
        let x = b.remove(at: i)
        for p in permutations(b) {
            res.append([x] + p)
        }
    }
    return res
}

print("Testing all permutations...")
let perms = permutations(parts)
for p in perms {
    test(message: p.joined(separator: ""), label: "Joined empty")
    test(message: p.joined(separator: "/"), label: "Joined slash")
}

// Special case: commonly used in some iGolf docs
test(message: "\(timestamp)\(apiKey)CourseListJSON", label: "ts + key + service + format")
test(message: "CourseList\(apiKey)1.12.0\(timestamp)JSON", label: "service + key + v1 + v2 + ts + format")

print("Done.")
