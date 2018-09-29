// Implement a function that checks whether an email address is valid. An email address has two parts: A "local part" and a "domain part." An @ sign separates the two parts: local-part@domain-part. The local part is the name of the mailbox; this is usually a username. The domain part is the domain name (e.g., gmail.com, yahoo.com.ph, or myCompanyName.com). The domain name contains a server name (sometimes called the mail server name) and a top-level domain (.com, .ph, etc.).
//
// For this practice problem, use the following criteria to determine whether an email address is valid:
//
// There must be one @ sign.
// The local part must contain one or more letters (A-Z, a-z) and/or digits (0-9). It may not contain any other characters.
// The domain part must contain two or more components with a single dot (.) between each component. Each component must contain one or more letters (A-Z, a-z).

// Input: a string (potentially) representing an email address
// Output: boolean (valid address/not valid address)

// Criteria for validity:
// - Three parts: mailbox — @ — domain
// - mailbox consists of >= 1 letters and digits
// - domain consists >= 2 components joined by dots ('.').
// - A component is >= 1 letters

// Approach:
// match the given address against regex that yields three parts (mailbox/@/domain)
// check whether the three parts together yield full email
// separately validate mailbox and domain

// regexes:
// 1.) /^(.*)(@)(.*)$/
// 2.) /^[A-Z0-9]+$/i
// 3.) /^[A-Z]+(\.[A-Z])+$/i

function isValidEmail(email) {
  var address = email.match(/(.*)(@)(.*)/)
  var mailbox = address[1].match(/^[A-Z0-9]+$/i)
  var domain  = address[3].match(/^[A-Z]+(\.[A-Z]+)+$/i)

  return !!(address && mailbox && domain)
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false
