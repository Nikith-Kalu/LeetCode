class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        paths.reduce(into: [Int:[String]]()) { hashMap, path in
            let components = path.split(separator: " ")
            for component in components.dropFirst() {
                let subComponents = component.split(separator: "(")
                hashMap[subComponents[1].hashValue, default:.init()].append(components[0]+"/"+subComponents[0])
            }
        }.values.filter {files in files.count > 1}
    }
}