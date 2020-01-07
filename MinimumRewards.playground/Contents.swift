import Swift

func findPalindromeLength(_ orginalStr: String) -> String {
  var currentLongest = [0,1]
    for i in 0 ..< orginalStr.count {
    var oddLeftIndex = i - 1
    var oddRightIndex =  i + 1
    let odd = getLongestPalindromeFrom(orginalStr, &oddLeftIndex,&oddRightIndex)
    var evenLeftIndex = i - 1
    var evenRightIndex = i
    let even = getLongestPalindromeFrom(orginalStr, &evenLeftIndex,&evenRightIndex)
    var tempLongest = [Int]()
    if let oddFirst = odd.first ,let oddLast = odd.last , let evenFirst = even.first ,let  evenLast = even.last {
      if oddLast -  oddFirst >  evenLast -  evenFirst {
        tempLongest  = odd
      } else {
        tempLongest = even
      }
    }

    if let tempLongestFirst = tempLongest.first ,let  tempLongestLast = tempLongest.last ,let  currentFirst = currentLongest.first ,let currentLast = currentLongest.last {
      if tempLongestLast - tempLongestFirst > currentLast -  currentFirst {
        currentLongest =  tempLongest
      }
    }

  }
  let firstIndex = orginalStr.index(orginalStr.startIndex, offsetBy: currentLongest.first!)
    let lastIndex = orginalStr.index(orginalStr.startIndex, offsetBy: currentLongest.last!)
    let result = String(orginalStr[firstIndex ..< lastIndex])
    return result
}

func getLongestPalindromeFrom(_ orginalStr: String, _ leftIndex: inout Int, _ rightIndex: inout Int) -> [Int] {
  while leftIndex >= 0, rightIndex < orginalStr.count {
    let leftStringIndex = orginalStr.index(orginalStr.startIndex, offsetBy: leftIndex)
    let rightStringIndex = orginalStr.index(orginalStr.startIndex, offsetBy: rightIndex)
    if orginalStr[leftStringIndex] != orginalStr[rightStringIndex] {
      break
    }
    leftIndex -= 1
    rightIndex += 1
  }
  return [leftIndex + 1 , rightIndex]
}



