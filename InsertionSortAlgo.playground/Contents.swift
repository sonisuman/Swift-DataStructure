var numbers = [3,5,7,8,89,23,45,67,345,245,67]

func insertionSort(_ items: inout Array<Int>) -> Array<Int> {
    
    for i in 0..<items.count {
        let key = items[i]
      var  j = i - 1
        while j >= 0 && items[j] > key {
            items[j + 1] = items[j]
            j = j - 1
        }
        items[j + 1] = key
    }
    return items
}

let sortedArray = insertionSort(&numbers)
print("sorted array ==== \(sortedArray)")
