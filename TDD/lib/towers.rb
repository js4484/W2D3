class Tower
    attr_accessor :pegs
    def initialize
        @pegs = [[1, 2, 3, 4], [], []]
    end

    def move(start_peg, end_peg)
      raise MoveError if !start_peg.between?(0,2) 
      raise MoveError if !end_peg.between?(0,2) 
      raise MoveError if pegs[start_peg].empty?

        start_disc = self.start_peg.shift
        end_peg.unshift(start_disc)

    end

    def won?
        return true if pegs[-1] == [1, 2, 3, 4]
        false
    end
end



class MoveError < StandardError; end

