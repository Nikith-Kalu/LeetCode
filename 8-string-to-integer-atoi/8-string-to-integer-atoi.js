var myAtoi = function(s) {
    
    let range = [-Math.pow(2, 31), (Math.pow(2, 31) - 1)];
    let nums = 0;
    let sign = 1;
    let i = 0;
    
    s = s.trim();
    
    if(isSign(s[i]) != null) {
        sign = isSign(s[i]);
        i++;
    }
    
    while(s[i] && isNumber(s.charCodeAt(i))) {
        nums = nums * 10 + Number(s[i]);
        i++;
    }
    nums = nums * sign;
    return nums > range[1] ? range[1] : nums < range[0] ? range[0] : nums;
};

function isNumber(c) {
    if(c >= 48 && c <= 57)
        return true;
    return false;
}

function isSign(c) {
    if(c == "-")
        return - 1;
    if(c == "+")
        return 1;
    return null;
}