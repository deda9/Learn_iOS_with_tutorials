import Foundation

let price: NSNumber = 100.59
let formatter = NumberFormatter()


formatter.numberStyle = .currency
formatter.string(from: price)


formatter.numberStyle = .percent
formatter.string(from: price)


formatter.numberStyle = .decimal
formatter.decimalSeparator = ","
formatter.string(from: price)


formatter.numberStyle = .ordinal
formatter.string(from: price)


formatter.numberStyle = .spellOut
formatter.string(from: price)


formatter.currencyCode = "Euro"
formatter.numberStyle = .currency
formatter.string(from: price)


formatter.locale = Locale(identifier: "cgg_UG")
formatter.numberStyle = .currency
formatter.string(from: price)


formatter.percentSymbol = " Per."
formatter.numberStyle = .percent
formatter.string(from: price)


formatter.numberStyle = .decimal
formatter.groupingSeparator = "-"
formatter.string(from: 100000.9)

formatter.numberStyle = .decimal
formatter.groupingSeparator = "-"
formatter.groupingSize = 2
formatter.string(from: 100000.9)


formatter.numberStyle = .decimal
formatter.locale = Locale(identifier: "ar")
formatter.string(from: price)
