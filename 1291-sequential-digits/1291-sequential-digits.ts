var sequentialDigits = function(low, high) {
    const result = [];
    const queue = [];
    for (let i = 1; i <= 9; i++) {
        queue.push(i);
    }

    while (queue.length > 0) {
        const num = queue.shift();
        if (num <= high && num >= low) {
            result.push(num);
        }

        if (num > high) break;

        let lastDigit = num % 10;
        if (lastDigit < 9) {
            const nextNum = num * 10 + (lastDigit + 1);
            queue.push(nextNum);
        }
    }

    return result;
}