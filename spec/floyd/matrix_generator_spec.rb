require 'spec_helper'
require 'floyd/matrix_generator'

RSpec.describe MatrixGenerator do
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

  describe '.matrix_value' do
    it { expect(subject.matrix_value(vertices, edges)).to eq(matrix_value) }
  end

  describe '.matrix_route' do
    it { expect(subject.matrix_route(matrix_value, vertices)).to eq(matrix_route) }
  end
end

