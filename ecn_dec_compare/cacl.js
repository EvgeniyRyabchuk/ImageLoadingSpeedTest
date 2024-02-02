
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
var args = process.argv.slice(2);
const res = (100 - ((args[0] / args[1]) * 100)).toFixed(0);
console.log(numberWithCommas(res)); 