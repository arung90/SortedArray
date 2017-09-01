import Foundation

print("Hello, World!")

var x = SortedArray(unsorted: [3, 1, 2], areInIncreasingOrder: <)
x.insert(-1)
print("Elements: \(x.elements)")

var y = SortedArray(unsorted: [90, 5, 87])
print("Elements: \(y.elements)")
