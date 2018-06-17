var greetings = function (names, details) {
  var formattedName = names.join(' ');
  var formattedTitle = details.title + ' ' + details.occupation;

  console.log('Hello, ' + formattedName + '! Nice to have a ' + formattedTitle + ' around.');
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.
