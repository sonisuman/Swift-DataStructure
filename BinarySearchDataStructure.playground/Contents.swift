let numbers = [2,4,5,7,23,56,58,67,89,105,150,230]

func findNumbers(from items: Array<Int>, _ value: Int) -> Bool {
    var found = false
    var middle = 0
    var upperBound = numbers.count - 1
    var lowerBound = 0
    while(lowerBound <= upperBound) {
        middle  = (upperBound + lowerBound)/2
        if items[middle] == value {
            found = true
            break
        } else if items[middle] < value {
            lowerBound = middle + 1
        } else {
            upperBound = middle - 1
        }
    }
    return found
}

let found = findNumbers(from: numbers, 5)
print("value found ====== \(found)")


extension Array where Iterator.Element == Int {
    
    func  containsElementUsingBinarySearch(_ value: Int) -> Bool {
        var found = false
        var middle = 0
        var upperBound = numbers.count - 1
        var lowerBound = 0
        while(lowerBound <= upperBound) {
            middle  = (upperBound + lowerBound)/2
            if numbers[middle] == value {
                found = true
                break
            } else if numbers[middle] < value {
                lowerBound = middle + 1
            } else {
                upperBound = middle - 1
            }
        }
        return found
    }
}
print("value Found =======\(numbers.containsElementUsingBinarySearch(34))")



