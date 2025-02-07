require_relative '../array_processor' # Убедись, что путь к файлу правильный
require 'rspec'

RSpec.describe ArrayProcessor do
  let(:array) { [1, 3, 5, 7, 9, 2, 4, 6, 8, 10] }
  let(:processor) { ArrayProcessor.new(array) }

  describe "#each_slice" do
    it "делит массив на подмассивы заданного размера" do
      result = []
      processor.each_slice(3) { |slice| result << slice }
      expect(result).to eq([[1, 3, 5], [7, 9, 2], [4, 6, 8], [10]])
    end
  end

  describe "#max_by" do
    it "находит один максимальный элемент по блоку" do
      expect(processor.max_by { |x| -x }).to eq([1]) # минимальный элемент, так как используем отрицание
    end

    it "находит несколько максимальных элементов" do
      expect(processor.max_by(3) { |x| x }).to eq([10, 9, 8])
    end
  end

  describe "#sort_by" do
    it "сортирует массив по переданному блоку" do
      expect(processor.sort_by { |x| -x }).to eq([10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
    end
  end

  describe "#reject" do
    it "удаляет элементы, соответствующие условию" do
      expect(processor.reject { |x| x.even? }).to eq([1, 3, 5, 7, 9])
    end
  end

  describe "#inject" do
    it "агрегирует элементы с начальным значением" do
      expect(processor.inject(10) { |sum, x| sum + x }).to eq(65)
    end

    it "агрегирует элементы без начального значения" do
      expect(processor.inject { |sum, x| sum + x }).to eq(55)
    end
  end

  describe "#cycle" do
    it "повторяет элементы массива n раз" do
      result = []
      processor.cycle(2) { |x| result << x }
      expect(result).to eq(array * 2)
    end
  end
end
