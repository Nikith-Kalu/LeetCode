function sequentialDigits(low, high) {
    const result = [];
    const minLen = low.toString().length;
    const maxLen = high.toString().length;

    for (let length = minLen; length <= maxLen; length++) {
        for (let start = 1; start <= 10 - length; start++) {
            let num = 0;
            for (let i = 0; i < length; i++) {
                num = num * 10 + (start + i);
            }

            if (num >= low && num <= high) {
                result.push(num);
            }
        }
    }

    return result;
}