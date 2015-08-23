$:.unshift File.expand_path('../lib',__FILE__)
require 'pry'
require 'pp'
require 'irb'
require 'irb/completion'

# FLOYD
require 'floyd/graph_parser'
require 'floyd/matrix_generator'
require 'floyd'
require 'fizzbuzz'

module Algorithm
  def self.floyd(input_graph=nil)
    input_graph = File.expand_path('../files/graph.txt',__FILE__)
    input =  GraphParser.new input_graph
    matrix_value = MatrixGenerator.matrix_value(input.vertices, input.edges)
    matrix_route = MatrixGenerator.matrix_route(matrix_value, input.vertices)
    Floyd.run!(matrix_value, matrix_route)
    puts "Matrix Value\n"
    pp matrix_value
    puts "\n\nMatrix Route"
    pp matrix_route
    nil
  end

  def self.fizzbuzz
    FizzBuzz.run!
  end
end

IRB.start
