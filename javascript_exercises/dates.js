// Mon, Jun 11th

var formattedMonth = function (date) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return months[date.getMonth()];
}

var dateWithSuffix = function (date) {
  var number = date.getDate();

  var suffix = '';

  if (number === 1 || number === 21 || number === 31) {
    suffix = 'st';
  } else if (number === 2 || number === 22) {
    suffix = 'nd';
  } else if (number === 3 || number === 23) {
    suffix = 'rd';
  } else {
    suffix = 'th';
  }

  return String(number) + suffix;
}


var formattedDay = function (date) {
  dayNum = date.getDay();

  var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return daysOfWeek[dayNum];
}

var formattedDate = function (date) {
  return formattedDay(today) + ", " + formattedMonth(today) + " " + dateWithSuffix(today);
}

var today = new Date();
console.log(formattedDate(today));
