def prime?(n)
  return false if n <= 1
  (2..Math.sqrt(n)).each do |i|
    return false if n % i == 0
  end
  true
end

def average_of_non_primes_greater_than_prime_avg(arr)
  primes = arr.select { |num| prime?(num) }
  non_primes = arr.reject { |num| prime?(num) }
  return 0 if primes.empty?
  prime_avg = primes.sum / primes.size.to_f
  filtered_non_primes = non_primes.select { |num| num > prime_avg }
  return 0 if filtered_non_primes.empty?
  filtered_non_primes.sum / filtered_non_primes.size.to_f
end
