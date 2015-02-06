require_relative "spec_helper"
require_relative "../lesson-04_homework"

describe "lesson-04_homework tests" do 
	it "count" do
		expect( count([1,2,3,4,5]){|el| el > 2} ).to eq(3)
	end

	it "select" do
		expect( select([1,2,3,4,5]){|el| el%2 == 0} ).to eq([2,4])
	end
end