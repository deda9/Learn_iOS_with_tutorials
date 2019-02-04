import Foundation

/// Use Decimal when dealing with money
var price: Decimal = 100.53


price._length
price.exponent
price.isZero
price.isFinite
price.isSignMinus
price.magnitude
price._reserved


price.nextDown.nextDown.nextDown.nextDown
price.nextUp.nextUp


price.advanced(by: 1)
price


price.distance(to: 10)


price.negate()
price.magnitude


let zero = NSDecimalNumber.zero
let one = NSDecimalNumber.one
let maximum = NSDecimalNumber.maximum

let two = one.adding(one)
let three = two.adding(one)

let nine = three.multiplying(by: three)
let ten = three.multiplying(by: three).adding(one)

