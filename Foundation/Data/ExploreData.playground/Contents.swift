import Foundation

let data = "Hello".data(using: .utf8)
print(data)

let upsideDown = "🙃".data(using: .utf8)
let sybmol = String(data: upsideDown!, encoding: .utf8)
print(sybmol)

var upsideUp = "🙂".data(using: .utf8)
var upEncoded = upsideUp!.base64EncodedData()

upEncoded.append(upsideDown!)
let news = String(data: upEncoded, encoding: .utf8)
print(news)



