import Foundation
import CryptoKit

let apiKey = "Oqt-mW0LBMYO-SI"
let secretKeyStr = "cca6_dw-pQ__JCtsH4q6ISpIbHM-ch"
let timestamp = "260310161247+0000"
let expectedSignature = "w0eadDrVks9MUsHWYeQKmMMtSd_9CeM5C-OAlxKu-ic"

func b64url(_ data: Data) -> String {
    return data.base64EncodedString()
        .replacingOccurrences(of: "+", with: "-")
        .replacingOccurrences(of: "/", with: "_")
        .replacingOccurrences(of: "=", with: "")
}

func decodeB64Url(_ s: String) -> Data? {
    var b64 = s
        .replacingOccurrences(of: "-", with: "+")
        .replacingOccurrences(of: "_", with: "/")
    while b64.count % 4 != 0 {
        b64 += "="
    }
    return Data(base64Encoded: b64)
}

func test(keyData: Data, message: String, label: String) {
    let key = SymmetricKey(data: keyData)
    let signature = HMAC<SHA256>.authenticationCode(for: Data(message.utf8), using: key)
    let b64 = b64url(Data(signature))
    if b64 == expectedSignature {
        print("✅ MATCH FOUND! \(label): \(message)")
    }
}

let keyDataRaw = Data(secretKeyStr.utf8)
let keyDataDecoded = decodeB64Url(secretKeyStr)

print("Testing variants...")
let variants = [
    "\(timestamp)\(apiKey)",
    "\(apiKey)\(timestamp)",
    "\(apiKey)\(secretKeyStr)\(timestamp)",
    "\(timestamp)\(apiKey)\(secretKeyStr)"
]

for v in variants {
    test(keyData: keyDataRaw, message: v, label: "RAW KEY + \(v)")
    if let d = keyDataDecoded {
        test(keyData: d, message: v, label: "DECODED KEY + \(v)")
    }
}
