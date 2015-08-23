require 'spec_helper'
require 'floyd'

RSpec.describe Floyd do
  let(:vertices) { ["A", "B", "C", "D", "E"] }
  let(:edges) { ["AB5", "BC4", "CD8", "DC8", "DE6", "AD5", "CE2", "EB3", "AE7"] }

  let(:matrix_value) do
    [[0               , 5               , Float::INFINITY , 5               , 7],
     [Float::INFINITY , 0               , 4               , Float::INFINITY , Float::INFINITY] ,
     [Float::INFINITY , Float::INFINITY , 0               , 8               , 2],
     [Float::INFINITY , Float::INFINITY , 8               , 0               , 6],
     [Float::INFINITY , 3               , Float::INFINITY , Float::INFINITY , 0]]
  end

  let(:matrix_route) do
    [["A" , "B" , 0   , "D" , "E"],
     [0   , "B" , "C" , 0   , 0],
     [0   , 0   , "C" , "D" , "E"],
     [0   , 0   , "C" , "D" , "E"],
     [0   , "B" , 0   , 0   , "E"]]
  end

  let(:calculated_value_matrix) do
    [[0               , 5 , 9 , 5  , 7],
     [Float::INFINITY , 0 , 4 , 12 , 6],
     [Float::INFINITY , 5 , 0 , 8  , 2],
     [Float::INFINITY , 9 , 8 , 0  , 6],
     [Float::INFINITY , 3 , 7 , 15 , 0]]
  end

  let(:calculated_route_matrix) do
    [["A" , "B" , "B" , "D" , "E"],
     [0   , "B" , "C" , "C" , "C"],
     [0   , "E" , "C" , "D" , "E"],
     [0   , "E" , "C" , "D" , "E"],
     [0   , "B" , "B" , "B" , "E"]]
  end

  describe '.run!' do
    it 'calculates the distance in the graph' do
      subject.run! matrix_value, matrix_route
      expect(matrix_value).to eq(calculated_value_matrix)
    end

    it 'calculates the route in the graph' do
      subject.run! matrix_value, matrix_route
      expect(matrix_route).to eq(calculated_route_matrix)
    end
  end
end

