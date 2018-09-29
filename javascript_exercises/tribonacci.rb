def tribonacci(signature, n)
  result = signature
  return [] if n == 0
  if (n < 4)
    return [signature[n - 1]]
  end
  counter = 3
  while counter < n
    result << result[-1] + result[-2] + result[-3]
    counter += 1
  end
  result
end
