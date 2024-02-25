impl Solution {
    pub fn can_traverse_all_pairs(nums: Vec<i32>) -> bool {
        if nums.len() == 1 {
            return true;
        }
        let (nums_len, nums) = {
            let (set, nums) = nums
                .into_iter()
                .fold(
                    (std::collections::HashSet::new(), Vec::new()),
                    |(mut set, mut vec), v| {
                        if !set.contains(&v) {
                            set.insert(v);
                            vec.push(v);
                        }

                        (set, vec)
                    }
                );
            if set.contains(&1) {
                return false;
            }

            let nums_len = nums.len();
            if nums_len == 1 {
                return true;
            }
            (nums_len, nums)
        };
        let mut visited = vec![false; nums_len];
        let mut edges = {
            let mut edges = std::collections::LinkedList::new();
            let mut j;
            for (i, num1) in nums.iter().enumerate() {
                let mut has_connection = false;
                j = i + 1;
                while j < nums_len {
                    if gcd(*num1, nums[j]) > 1 {
                        edges.push_back((i, j));
                        has_connection = true;
                        visited[j] = true;
                    }
                    j += 1;
                }
                if !has_connection && !visited[i] {
                    return false;
                }

                visited[i] = true;
            }
            edges
        };
        let mut width = edges.len();
        if width < nums_len - 1 {
            return false;
        }
        visited[0] = false;
        let mut prev_width = width;
        let mut num_visited = 1;
        while let Some(edge) = edges.pop_front() {
            let newly_visited = match (visited[edge.0], visited[edge.1]) {
                (false, true) => Some(edge.1),
                (true, false) => Some(edge.0),
                _ => {
                    edges.push_back(edge);
                    None
                }
            };

            if let Some(v) = newly_visited {
                visited[v] = false;
                num_visited += 1;
            }

            width -= 1;
            if width == 0 {
                if num_visited == nums_len {
                    return true;
                }
                if edges.is_empty() {
                    break;
                }
                width = edges.len();
                match width == prev_width {
                    true => return false,
                    false => prev_width = width
                }
            }
        }
        num_visited == nums_len
    }
}
fn gcd(mut a: i32, mut b: i32) -> i32 {

    let mut temp;
    while b != 0 {
        temp = a % b;
        a = b;
        b = temp;
    }

    a
}