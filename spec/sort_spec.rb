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

  describe '.merge' do
    context 'when the arguments are empty' do
      it "returns an empty array" do
        expect(Sort.merge([], [])).to eq([])
      end
    end

    context 'when one of the arguments is empty' do
      it "returns the other array" do
        a = [5, 7, 9]
        expect(Sort.merge(a, [])).to eq(a)
        expect(Sort.merge([], a)).to eq(a)
      end
    end

    context 'when each array has 1 element' do
      it "returns an array with both elements sorted" do
        expect(Sort.merge([5], [2])).to eq([2, 5])
      end
    end

    context 'when you have 2 large sorted arrays' do
      it "returns a sorted array that is the combination of the two" do
        a = [2, 6, 10, 26, 58, 89, 103]
        b = [1, 5, 11, 13, 15, 19, 60, 61, 62]
        result = (a+b).sort
        expect(Sort.merge(a, b)).to eq(result)
      end
    end
  end

  describe '.mergesort' do
    context 'when the argument is empty' do 
      it "returns an empty array" do
        expect(Sort.mergesort([])).to eq([])
      end
    end

    context 'when the argument has 1 number' do 
      it "returns the same array" do
        expect(Sort.mergesort([1])).to eq([1])
      end
    end

    context 'when the argument has sorted elements' do 
      it "returns the same array" do
        expect(Sort.mergesort([1, 2, 3])).to eq([1, 2, 3])
      end
    end

    context 'when the argument has unsorted elements' do 
      it "returns a sorted array" do
        expect(Sort.mergesort([2, 1, 3])).to eq([1, 2, 3])
      end
    end

    context 'when the argument has repeating elements' do 
      it "returns a sorted array" do
        expect(Sort.mergesort([3, 2, 3])).to eq([2, 3, 3])
      end
    end

    context 'when the argument is large and randomized' do 
      it "returns a sorted array" do
        large_array = []
        100.times {large_array << rand(1000)}
        sorted_array = large_array.sort
        expect(Sort.mergesort(large_array)).to eq(sorted_array)
      end
    end
  end
end