require_relative "../app/calculator.rb"
require_relative "../app/error.rb"

RSpec.describe Calculator do

  describe "#add" do
    context "empty string given" do
      it "returns zero" do
         expect(Calculator.new.add("")).to eq(0)
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

    context "given double digits" do
        context "'2,36'" do
            it "returns 38" do
                expect(Calculator.new.add("2,36")).to eq(38)
            end
        end
    end 

    context "given multiple digits" do
        context "'2,456,6,8,9,0,45,66'" do
            it "returns 592" do
                expect(Calculator.new.add("2,456,6,8,9,0,45,66")).to eq(592)
            end
        end
    end

    context "given newline with comma" do
        context "'2,4\n6\n8\n15,4,8'" do
            it "returns 47" do
                expect(Calculator.new.add("2,4\n6\n8\n15,4,8")).to eq(47)
            end
        end
    end

    context "given different delimiters" do
        context "'//;\n1;2;300;400'" do
            it "returns 703" do 
                expect(Calculator.new.add("//;\n1;2;300;400")).to eq(703)
            end
        end

        context "//{\n1{2{300{400" do
            it "returns 703" do
                expect(Calculator.new.add("//{\n1{2{300{400")).to eq(703)
            end  
        end
    end

    context "given negative numbers" do
        context "1,2,-2,-3,-5" do
            it "returns negative number not allowed error" do
                expect{Calculator.new.add("1,2,-3,-2,-5")}.to raise_error(NegativeNumberNotAllowedError,"negative numbers not allowed -2,-3,-5")
            end
        end

        context "1,2,-3\n-4" do
            it "returns negative number not allowed" do
                expect{Calculator.new.add("1,2,-3\n-4")}.to raise_error(NegativeNumberNotAllowedError,"negative numbers not allowed -3,-4")
            end
        end

        context "'//;\n1;2;-300;-400" do
            it "returns negative number not allowed" do
                expect{Calculator.new.add("//;\n1;2;-300;-400")}.to raise_error(NegativeNumberNotAllowedError,"negative numbers not allowed -300,-400")
            end
        end
    end

    context "given numbers greater than 1000" do
        it "returns 2" do
            expect(Calculator.new.add("2,1000,2000")).to eq(2)
        end
    end
  end
end