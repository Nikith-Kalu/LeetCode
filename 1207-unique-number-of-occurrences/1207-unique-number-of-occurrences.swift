class Solution {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
    var occurrenceDict = [Int: Int]()

    for num in arr {
        occurrenceDict[num, default: 0] += 1
    }

    let occurrenceSet = Set(occurrenceDict.values)

    return occurrenceSet.count == occurrenceDict.count
}

}