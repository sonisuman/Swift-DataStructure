var numbers = [2,4,6,4,67,76,78,34,56,89,93]

func bubbleSort( _ Items: inout Array<Int>) -> Array<Int> {
    
    for i in 0..<Items.count {
        
        for j in 0..<Items.count {
            
            if Items[i] < Items[j] {
                //inbult swap method
                Items.swapAt(i, j)
                //manual swap operation
                //let temp = Items[i]
                //Items[i] = Items[j]
                //Items[j] = temp
            }
        }
    }
    return Items
}

let sortedArray = bubbleSort(&numbers)
print(sortedArray)
