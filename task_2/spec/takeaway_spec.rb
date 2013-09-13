require 'takeaway'
describe Takeaway do
	let(:takeaway) {Takeaway.new}

	it 'lists the dishes with the prices' do
		expect(takeaway.list_price 'tom_yum_soup' ).to eq 4
	end

	it 'can take an order' do
		takeaway.takes_order 'burger',2
		expect(takeaway.current_order).to include "burger" =>2 
	end

	it 'can list the name of all the order I have made so far' do
		takeaway.takes_order 'burger',2
		takeaway.takes_order 'tom_yum_soup',1

		expect
	end




end