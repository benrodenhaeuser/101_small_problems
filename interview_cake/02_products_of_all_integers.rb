# You have a list of integers, and for each index you want to find the product of every integer except the integer at that index. Write a function get_products_of_all_ints_except_at_index() that takes a list of integers and returns a list of the products.

=begin
Understanding/Requirements:
- Given an array of integers
- For every index in the array: compute the product of the integers at all the other indices in the array
- Return the list of the products computed in this way

Edge cases:
- What about empty array? => Return nil
- What about 1-element array? => Return 0
- What about incorrect types? => Assume input consists solely of integers

Examples:

- given [1, 7, 3, 4],
- return [84, 12, 28, 21],
- which is [7 * 3 * 4,  1 * 3 * 4,  1 * 7 * 4,  1 * 7 * 3].

Algorithm: 


=end
