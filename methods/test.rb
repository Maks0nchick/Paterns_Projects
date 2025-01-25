# spec/array_methods_spec.rb
require 'rspec'
require_relative '../array_methods'

RSpec.describe ArrayMethods do
  let(:array_methods) { ArrayMethods.new([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) }

  describe "#each_slice" do
    it "splits the array into slices of the specified size" do
      result = []
      array_methods.each_slice(3) { |slice| result << slice }
      expect(result).to eq([[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]])
    end
  end

  describe "#max_by" do
    it "returns the elements with the highest values according to the block" do
      result = array_methods.max_by(3) { |x| x.even? ? x : -1 }
      expect(result).to eq([10, 8, 6])
    end

    it "returns nil if the array is empty" do
      empty_array = ArrayMethods.new([])
      result = empty_array.max_by { |x| x }
      expect(result).to be_nil
    end
  end

  describe "#sort_by" do
    it "sorts the array by the values returned by the block" do
      result = array_methods.sort_by { |x| -x }
      expect(result).to eq([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
    end

    it "returns nil if the array is empty" do
      empty_array = ArrayMethods.new([])
      result = empty_array.sort_by { |x| x }
      expect(result).to be_nil
    end
  end

  describe "#reject" do
    it "rejects elements based on the block condition" do
      result = array_methods.reject { |x| x.even? }
      expect(result).to eq([1, 3, 5, 7, 9])
    end
  end

  describe "#inject" do
    it "returns the accumulated result based on the block" do
      result = array_methods.inject { |sum, x| sum + x }
      expect(result).to eq(55)
    end

    it "returns the initial value if provided" do
      result = array_methods.inject(10) { |sum, x| sum + x }
      expect(result).to eq(65)
    end

    it "returns nil for an empty array" do
      empty_array = ArrayMethods.new([])
      result = empty_array.inject { |sum, x| sum + x }
      expect(result).to be_nil
    end
  end

  describe "#cycle" do
    it "cycles the array elements the specified number of times" do
      result = []
      array_methods.cycle(2) { |x| result << x }
      expect(result).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    end

    it "does nothing if the cycle number is 0" do
      result = []
      array_methods.cycle(0) { |x| result << x }
      expect(result).to eq([])
    end
  end
end
