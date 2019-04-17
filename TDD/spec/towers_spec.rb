require "rspec"
require "towers"

describe "Towers of Hanoi" do
    subject(:tower) { Tower.new }
    
    describe "#intialize" do
        it "sets up game" do
            expect(tower.pegs).to eq([[1, 2, 3, 4], [], []])
        end
    end

    describe "#move" do
        it "raises a MoveError if start_peg is invalid" do
            expect { tower.move(3, 0) }.to raise_error(MoveError)
        end
        it "raises a MoveError if end_peg is invalid" do
            expect { tower.move(0, 3) }.to raise_error(MoveError)
        end
        it "raises a MoveError if start peg is empty" do
            expect { tower.move(2, 0) }.to raise_error(MoveError)
        end
        it "moves a disc" do
            tower.move(0,1)
            expect(tower.pegs).to eq([[2, 3, 4], [1], []]) 
        end
       
        it "can't put a larger disc on a smaller disc" do
            tower.move(0,1)
            
            expect { tower.move(0, 1) }.to raise_error(MoveError)
        end
 
    end
    
    describe "#won?" do
        it "checks if the last peg has a discs in order" do
            expect(true) if tower.pegs[-1] == [1, 2, 3, 4]
            expect(false) if tower.pegs[-1] != [1, 2, 3, 4]
        end
    end
end

#Takes in start and end
#Source array contains objects
#Destination array has larger object or nothing