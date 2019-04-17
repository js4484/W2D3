require "byebug"
class Array
    
    #my_unique
    def my_unique
        new_arr = []
        self.each { |el| new_arr << el unless new_arr.include?(el) }
        new_arr
    end

    #two_sum
    def two_sum
        new_arr = []
        (0...self.length).each do |idx1|
            (idx1...self.length).each do |idx2|
                new_arr << [idx1, idx2] if self[idx1] + self[idx2] == 0 && idx1 < idx2
            end
        end
        new_arr
    end
    
    #my_transpose
    def my_transpose
        new_arr = []
        (0...self.length).each do |row|
            temp_arr = []
            (0...self.length).each do |col|
                temp_arr << self[col][row]
            end
            new_arr << temp_arr
        end 
        new_arr
    end

    #stock_picker
    def stock_picker
        profit = 0
        days = []
        (0...self.length).each do |day1|
            (day1...self.length).each do |day2|
                if self[day2] - self[day1] > profit && day1 < day2
                    profit = self[day2] - self[day1]
                    days = [day1, day2]
                end
            end
        end
        days
    end
end
