require 'spec_helper'
require 'floyd/graph_parser'

RSpec.describe GraphParser do
  subject { GraphParser.new File.expand_path('../../support/graph.txt', __FILE__) }

  context 'at startup' do
    it 'carries graph file' do
      expect(subject.instance_variable_get :@content_file).to eq("AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7\n")
    end

    it 'triggers exception when the file does not exist' do
      expect { GraphParser.new 'spec/support/invalid_file.txt' }.to raise_error(Errno::ENOENT)
    end
  end

  describe '#vertices' do
    it { expect(subject.vertices).to eq(["A", "B", "C", "D", "E"]) }
  end

  describe '#edges' do
    it { expect(subject.edges).to eq(["AB5", "BC4", "CD8", "DC8", "DE6", "AD5", "CE2", "EB3", "AE7"]) }
  end
end

