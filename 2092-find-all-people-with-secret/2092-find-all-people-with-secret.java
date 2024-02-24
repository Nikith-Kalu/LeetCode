class Solution {
    public List<Integer> findAllPeople(int n, int[][] meetings, int firstPerson) {
        Arrays.sort(meetings, (a, b) -> Integer.compare(a[2], b[2]));

        Map<Integer, List<int[]>> timelineToMeetings = new TreeMap<>();
        for (int[] meeting : meetings) {
            timelineToMeetings.computeIfAbsent(meeting[2], k -> new ArrayList<>()).add(meeting);
        }

        boolean[] knowsSecret = new boolean[n];
        knowsSecret[0] = knowsSecret[firstPerson] = true;
        for (Map.Entry<Integer, List<int[]>> entry : timelineToMeetings.entrySet()) {
            List<int[]> timelineMeetings = entry.getValue();

            Map<Integer, List<Integer>> graph = new HashMap<>();
            for (int[] meeting : timelineMeetings) {
                int person1 = meeting[0];
                int person2 = meeting[1];
                graph.computeIfAbsent(person1, k -> new ArrayList<>()).add(person2);
                graph.computeIfAbsent(person2, k -> new ArrayList<>()).add(person1);
            }

            Queue<Integer> queue = new LinkedList<>();
            for (int[] meeting : timelineMeetings) {
                if (knowsSecret[meeting[0]] && !knowsSecret[meeting[1]]) {
                    knowsSecret[meeting[1]] = true;
                    queue.add(meeting[1]);
                }
                if (!knowsSecret[meeting[0]] && knowsSecret[meeting[1]]) {
                    knowsSecret[meeting[0]] = true;
                    queue.add(meeting[0]);
                }
            }
            while (!queue.isEmpty()) {
                int person = queue.poll();
                for (int nextPerson : graph.getOrDefault(person, Collections.emptyList())) {
                    if (!knowsSecret[nextPerson]) {
                        knowsSecret[nextPerson] = true;
                        queue.add(nextPerson);
                    }
                }
            }
        }
        List<Integer> ret = new ArrayList<>();
        for (int i = 0; i < n; ++i) {
            if (knowsSecret[i]) {
                ret.add(i);
            }
        }
        return ret;
    }
}