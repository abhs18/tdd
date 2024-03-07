require_relative "../app/calculator.rb"

RSpec.describe Calculator do

  describe "#add" do
    context "empty string given" do
      it "returns zero" do
         expect(Calculator.new.add("     ")).to eq(0)
      end
    end

    context "given single digit" do
        context "given '3'" do
            it "returns 3" do
                expect(Calculator.new.add("3")).to eq(3)
            end
        end
        context "given '7'" do
            it "returns 7" do
                expect(Calculator.new.add("7")).to eq(7)
            end
        end
    end
  end
  
end