// Espruino 1v84

var time_start = new Date.now();
var time_now = new Date.now();

function time_diff_readable(time_start, time_end) {
  var time_diff = new Date(time_end - time_start);
  var time_diff_human_readable = {};
  //time_diff_human_readable.days  = time_diff.getDay();
  time_diff_human_readable.hours = time_diff.getHours();
  time_diff_human_readable.min   = time_diff.getMinutes();
  time_diff_human_readable.sec   = time_diff.getSeconds();
  return(time_diff_human_readable);
}

JSON.stringify(time_diff_readable(time_start,Date.now()))
