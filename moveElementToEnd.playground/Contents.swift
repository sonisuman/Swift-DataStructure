//moveElementToEnd

func moveElementToEnd(_ array: inout [Int], _ toMove: Int) -> [Int] {
    // Write your code here.
    var i = 0
    var j = array.count - 1
    
    while i < j {
        while i < j , array[j] == toMove {
            j -= 1
        }
        if array[i] == toMove {
            (array[i],array[j]) = (array[j],array[i])
        }
        i += 1
    }
    return array
}
var testArray = [2,4,2,5,4,6,7,2,3,4,5,4,5,4,5,4,5,4]
print(moveElementToEnd(&testArray, 4))
