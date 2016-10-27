
require 'thread'

NUM_THREADS = if defined? Java::Java
                Java::Java.lang.Runtime.getRuntime.availableProcessors
              else
                1
              end

# Work for positive integer inputs
def collatz_sequence_length(n)
  len = 0
  loop do
    len = len + 1
    if n ==  1
      break
    else
      if n % 2 == 0 # even
        n = n / 2
      else # odd
        n = (3 * n) + 1
      end
    end
  end
  len
end

work_queue = Queue.new
semaphore = Mutex.new
number_producing_longest_chain = nil
longest_chain_length = 0

# Populate work_queue with jobs
(1...1_000_000).each do |i|
  work_queue.push i
end

(0...NUM_THREADS).map do # Mini thread pool to keep CPU saturated
  Thread.new do
    begin
      while number_producing_chain = work_queue.pop(true)
        chain_length = collatz_sequence_length(number_producing_chain)

        semaphore.synchronize do
          if chain_length > longest_chain_length
            number_producing_longest_chain = number_producing_chain
            longest_chain_length = chain_length
          end
        end
      end
    rescue
    end
  end
end.map(&:join)

puts "#{number_producing_longest_chain} produced a Collatz of length #{longest_chain_length}."

=begin
C:\ProjectEulerSolutions>jruby 014.rb
837799 produced a Collatz of length 525.

C:\ProjectEulerSolutions>jruby -v
jruby 9.1.5.0 (2.3.1) 2016-09-07 036ce39 Java HotSpot(TM) 64-Bit Server VM 25.112-b15 on 1.8.0_112-b15 +jit [mswin32-x86_64]

=end
