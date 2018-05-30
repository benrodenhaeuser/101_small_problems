// Build a program that asks a user for the length and width of a room in meters, and then logs to the console the area of the room in both square meters and square feet.

// Note: 1 square meter == 10.7639 square feet

// Do not worry about validating the input at this time. Use the prompt() function to collect user input.

var howBig = function howBig() {
  var length = Number(prompt("What is the length of the room in meters?"));
  var width = Number(prompt("What is the width of the room in meters?"));

  areaInMeters = length * width;
  areaInFeet = areaInMeters * 10.7639;

  console.log("Area in meters: " + String(areaInMeters));
  console.log("Area in feet: " + areaInFeet.toFixed(2));
}

howBig();
