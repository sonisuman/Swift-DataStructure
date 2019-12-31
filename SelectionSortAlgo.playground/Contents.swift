var numbers = [2,4,6,8,6,9,34,56,67,78,64]

func selectionSort(_ items: inout Array<Int>) -> Array<Int> {
    for i in 0..<items.count {
        var minIndex = i
        for j in (i + 1)..<items.count {
            if items[j] > items[minIndex] {
                minIndex = j
            }
            //                let temp = items[minIndex]
            //                items[minIndex] = items[j]
            //                items[j] = temp
            
            items.swapAt(i, minIndex)
        }
    }
    return items
}

let sortedArray = selectionSort(&numbers)
print("sorted array ====== \(sortedArray)")
