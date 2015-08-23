$:.unshift File.expand_path('../lib',__FILE__)
require 'pry'
require 'pp'
require 'irb'
require 'irb/completion'
require 'benchmark'

# FLOYD
require 'floyd/graph_parser'
require 'floyd/matrix_generator'
require 'floyd'
require 'fizzbuzz'
require 'factorial'

module Algorithm
  def self.floyd(input_graph=nil)
    input_graph = File.expand_path('../files/graph.txt',__FILE__)
    input =  GraphParser.new input_graph
    matrix_value, matrix_route = nil

    Benchmark.bm(12)  do |x|
      x.report('matrix_value: ') { matrix_value = MatrixGenerator.matrix_value(input.vertices, input.edges) }
      x.report('matrix_route: ') { matrix_route = MatrixGenerator.matrix_route(matrix_value, input.vertices) }
      x.report('floyd: ') { Floyd.run!(matrix_value, matrix_route) }
      puts
      puts "Matrix Value\n"
      pp matrix_value
      puts "\n\nMatrix Route"
      pp matrix_route
    end
    nil
  end

  def self.fizzbuzz
    puts Benchmark.measure { FizzBuzz.run! }
  end

  def self.factorial(n=5)
    puts Benchmark.measure { Factorial.run!(n) }
  end
end

IRB.start
