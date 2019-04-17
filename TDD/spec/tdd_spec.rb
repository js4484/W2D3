require "rspec"
require "tdd.rb"

describe "Array#my_unique" do
    let(:arr) { [1, 2, 3, 3, 4, 5, 5, 5] }
    it "takes in an array" do
        expect(arr).to receive(:my_unique)
        arr.my_unique
    end
    it "returns new array with no dupes" do
        expect(arr.my_unique).to eq([1,2,3,4,5])
        expect(arr.my_unique).to_not be(arr)
    end
end

describe "Array#two_sum" do
    let(:arr) { [-1, 0, 2, -2, 1] }
    it "takes in an array" do
        expect(arr).to receive(:two_sum)
        arr.two_sum
    end
    it "returns new array containing pairs that sum to 0" do
        expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
    # it "returns pairs sorted in dictionary order" do #Is this ok?
    #     expect(arr.two_sum).to_not eq([[2, 3], [0, 4]])
    # end
end

describe "Array#my_transpose" do 
    let(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] } 
    let(:cols) { [[0, 3, 6], [1, 4, 7], [2, 5, 8]] } 
    it "takes in a 2D array" do
        equ = rows.all? { |ele| ele.is_a?(Array)} 
        expect(equ).to eq(true)
    end
    it "transposes a 2D array" do
        expect(rows.my_transpose).to eq(cols)
        expect(cols.my_transpose).to eq(rows)
    end
end

describe "Array#stock_picker" do
    let(:stock_value) { [40, 38, 52, 76, 23, 12, 90] }
    it "takes in an array" do
        expect(stock_value).to receive(:stock_picker)
        stock_value.stock_picker
    end
    it "ouputs the most profitable pair of days" do
        expect(stock_value.stock_picker).to eq([5, 6])
    end
end


