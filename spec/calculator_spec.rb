require_relative "../app/calculator.rb"

RSpec.describe Calculator do
  # frozen_string_literal: true
  
  describe "#add" do
    context "empty string given" do
      it "returns zero" do
         expect(Calculator.new.add(" ")).to eq(0)
      end
    end
  end
  
end