class Heap<T : Comparable>{
  var heapArray = [T]()
  //Get Indices
  private func getLeftChildIndex(_ parentIndex : Int)->Int{
    return 2*parentIndex + 1
  }
  
  private func getRightChildIndex(_ parentIndex : Int)->Int{
    return 2*parentIndex + 2
  }
  
  private func getParentIndex(_ childIndex : Int)->Int{
    return (childIndex - 1)/2
  }
  
  //Get Bools
  private func hasLeftChild(_ index:Int)-> Bool {
    return getLeftChildIndex(index) < heapArray.count
  }
  
  private func hasRightChild(_ index : Int) -> Bool {
    return getRightChildIndex(index) < heapArray.count
  }
  
  private func hasParent(_ index : Int)->Bool {
    return getParentIndex(index) >= 0
  }
  
  //GetItems
  private func leftChild(_ index : Int) -> T{
    return heapArray[getLeftChildIndex(index)]
  }
  
  private func rightChild(_ index : Int) -> T {
    return heapArray[getRightChildIndex(index)]
  }
  
  private func parent(_ index: Int) ->T {
    return heapArray[getParentIndex(index)]
  }
  
  public func peek()-> T {
    if heapArray.isEmpty {
      fatalError()
    } else {
      return heapArray.first!
    }
  }
  
  public func poll()->T{
    if heapArray.isEmpty {
      fatalError()
    } else{
      let item = heapArray[0]
      heapArray[0] = heapArray[heapArray.count - 1]
      heapifyDown()
      heapArray.removeLast()
      return item
    }
  }
  
  public func add(_ item : T){
    heapArray.append(item)
    heapifyUp()
  }
  public func swap(_ index1 : Int,index2 : Int){
    let temp = heapArray[index1]
    heapArray[index1] = heapArray[index2]
    heapArray[index2] = temp
  }
  func heapifyDown(){
    var index = 0
    while index < heapArray.count {
      let leftChildIndex = getLeftChildIndex(index)
      let rightChildIndex = getRightChildIndex(index)
      if leftChild(leftChildIndex) < heapArray[index] {
        swap(leftChildIndex, index2: index)
        index = leftChildIndex
      } else if rightChild(rightChildIndex) < heapArray[index] {
        swap(rightChildIndex, index2: index)
        index = rightChildIndex
      }
      
    }
  }
  
  func heapifyUp(){
    var index = heapArray.count - 1
    while hasParent(index) && parent(index) > heapArray[index] {
      let parentIndex = getParentIndex(index)
      swap(parentIndex, index2: index)
      index = parentIndex
    }
  }
}
