class Solution {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        let sortedMeetings = meetings.sorted { $0[0] < $1[0] }
        var roomAvailability = Array(repeating: 0, count: n)
        var meetingsCount = Array(repeating: 0, count: n)

        for meeting in sortedMeetings {
            let startTime = meeting[0]
            let endTime = meeting[1]
            
            // Attempt to find the first available room
            var earliestAvailableTime = Int.max
            var roomIndexToUse = -1
            for roomIndex in 0..<n {
                if roomAvailability[roomIndex] <= startTime {
                    roomIndexToUse = roomIndex
                    break
                } else if roomAvailability[roomIndex] < earliestAvailableTime {
                    earliestAvailableTime = roomAvailability[roomIndex]
                    roomIndexToUse = roomIndex
                }
            }
            
            roomAvailability[roomIndexToUse] = max(roomAvailability[roomIndexToUse], startTime) + (endTime - startTime)
            meetingsCount[roomIndexToUse] += 1
        }
        
        // Determine the room with the most meetings
        var maxMeetings = 0
        var roomWithMostMeetings = 0
        for i in 0..<n {
            if meetingsCount[i] > maxMeetings {
                maxMeetings = meetingsCount[i]
                roomWithMostMeetings = i
            } else if meetingsCount[i] == maxMeetings && i < roomWithMostMeetings {
                roomWithMostMeetings = i
            }
        }
        
        return roomWithMostMeetings
    }
}
