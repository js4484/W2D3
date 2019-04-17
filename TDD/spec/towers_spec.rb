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
        it "takes in a valid start" do
            tower.move(start_peg, end_peg)
            start_peg = tower.pegs[start_peg]
            expect(start_peg).to be_between(0, 2).inclusive
            expect(start_peg).not_to be_empty
        end

        context "takes in a valid end" do
            it "chooses a peg that exists" do
                tower.move(start_peg, end_peg)
                expect(end_peg).to be_between(0, 2).inclusive
            end

            context "when end peg is empty" do
                it "moves start disc onto chosen peg" do
                    start_disc = tower.pegs[start_peg][0]
                    end_disc = tower.pegs[end_peg][0]
                    end_peg = tower.pegs[end_peg]
                    expect(end_peg).to be_empty
                end
            end
            context "when end peg has discs" do
                it "puts start disc on top of chosen peg" do
                     start_disc = tower.pegs[start_peg][0]
                    end_disc = tower.pegs[end_peg][0]
                    end_peg = tower.pegs[end_peg]
                    expect(start_disc).to be < end_disc
                end
            end

        end

        it "raises MoveError if start or end is invalid" do
            expect { tower.move(4,4) }.to raise_error(MoveError)

        end

        it "removes starting peg" do
            @pegs
            start_disc = tower.pegs[start_peg][0]
            tower.move(start_peg, end_peg)
           
            expect(tower.pegs[start_peg]).not_to include(start_disc)
        end

        it "moves peg to end position" do
            @pegs
            start_disc = tower.pegs[start_peg][0]
            tower.move(start_peg, end_peg)
            expect(tower.pegs[end_peg][0]).to eq(start_disc)
        end
    
    end
    
    describe "#won?" do
        it "checks if the las peg has a discs in order" do
            expect(true) if tower.pegs[-1] == [1, 2, 3, 4]
            expect(false) if tower.pegs[-1] != [1, 2, 3, 4]
        end
    end
end

#Takes in start and end
#Source array contains objects
#Destination array has larger object or nothing