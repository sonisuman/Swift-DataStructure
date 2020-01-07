class BST {
    var value: Int
    var left: BST?
    var right: BST?

    init(value: Int) {
        self.value = value
        left = nil
        right = nil
    }
}

func findClosestValueInBST(tree: BST?, target: Int) -> Int {
    var closest = Int(Int32.max)
    
    return findClosestValueInBSThelper(tree,target,&closest)
}

func findClosestValueInBSThelper(_ treeValue: BST?, _ target: Int,_ closest: inout Int) -> Int {

   if treeValue == nil {
      return closest
   }
    if let tree = treeValue {
        let closestDifference = target  - closest
        let currentDifference = target - tree.value
        
        if closestDifference.magnitude > currentDifference.magnitude {
            closest = tree.value
        }
    }
        
        if let tree = treeValue , target < tree.value {
            if let left = tree.left {
                return findClosestValueInBSThelper(left,target, &closest)
            }
            else {
                return closest
            }
        }
        else if let tree = treeValue , target > tree.value {
            if let right = tree.right {
                return findClosestValueInBSThelper(right,target, &closest)
            }
            else {
                return closest
            }
    }
        else {
            return closest
        }
    }


