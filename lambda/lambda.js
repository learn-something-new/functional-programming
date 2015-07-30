// findSum accepts two variables and a function
// combining the two variables and passing that 
// into the passed function
function findSum(x, y, cb) {
    var result = x + y;
    cb(result);
}

// here we call findSum passing two numbers and a 
// lambda function that creates an alert box showing
// the sum
findSum(1, 2, function(x) {
    window.alert(x);
});
