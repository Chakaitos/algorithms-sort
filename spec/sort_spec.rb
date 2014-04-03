require 'rubygems'
require 'rspec'
require_relative '../sort.rb'

describe 'Sort' do
  describe '.selection_sort' do

    context 'when the argument is empty' do
      it "returns an empty array" do
        expect(Sort.selection_sort([])).to eq([])
      end
    end

    it "returns the same array if it contains only one element" do
      expect(Sort.selection_sort([1])).to eq([1])
    end

    it "test sorting with negative numbers" do
      expect(Sort.selection_sort([10, -16, 3, -20, 1])).to eq([-20, -16, 1, 3, 10])
    end

    it "test sorting with duplicate numbers" do
      expect(Sort.selection_sort([1, 10, 3, 20, 1])).to eq([1, 1, 3, 10, 20])
    end

    it "test sorting a large array with random numbers" do
    	array = (0..350).collect{ rand(1000) } 
    	sorted_array = array.sort
      expect(Sort.selection_sort(array)).to eq(sorted_array)
    end
  end
end