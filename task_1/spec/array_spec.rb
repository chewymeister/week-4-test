require 'array'

describe Array do
	it 'should calculate the sum of the array' do
		array = [1,2,3,4]
		expect(array.inject_2{|sum, num| sum + num}).to eq 10
	end

	it 'should add strings together' do
		array = ['1','2','3','4']
		expect(array.inject_2{|sum, num| sum + num}).to eq '1234'
	end

end