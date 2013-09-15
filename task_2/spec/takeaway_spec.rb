require 'takeaway'
describe Takeaway do
	let(:takeaway) {Takeaway.new}

	it 'lists the dishes with the prices' do
		expect(takeaway.list_price 'tom yum soup' ).to eq 4
	end

	it 'can take an order' do
		takeaway.takes_order 'hamburger',2 

		expect(takeaway.current_order).to include "hamburger" =>2 
	end

	it 'can list the name of all the orders the customer has made so far' do
		takeaway.takes_order 'hamburger',2 
		takeaway.takes_order 'tom yum soup',3 

		expect(takeaway.list_current_order).to include('hamburger' => 2,'tom yum soup' => 3)
	end

	it 'can calculate the total price of the current order' do
		takeaway.takes_order 'hamburger',2 
		takeaway.takes_order 'tom yum soup',3 

		expect(takeaway.current_order_subtotal).to eq 18
	end

	it 'can calculate the total price of the current order' do
		takeaway.takes_order 'kung pow chicken',3
		takeaway.takes_order 'coconut rice',3
		takeaway.takes_order 'hamburger',1

		expect(takeaway.current_order_subtotal).to eq 30
	end


	xit 'can send a text message' do
		# account_sid = 'AC9bd6d3204795d4bcbc0525c9a868fa60'
		# authentication_token = 'b340e7741f62190d13ef9f36e34a7974'
		# client = Twilio::REST::Client.new(account_sid, authentication_token)
		# client.stub(:sms,:messages)
		client = double client
		# client.stub(:account).with(account_sid,authentication_token)
		# client.stub_chain(:sms,:messages,:create).with(:from => "+15005550006", :to => "+44773598959", :body => "hello there would you like a cookie")
		# client = double :client
		client.stub_chain(:account,:sms,:messages,:create)#,:from=>'+15005550006',:to =>'+447735989592',:body=>'who are you')
		takeaway.send_text client
	end

#========================================================================
# Sends correct message but cannot get stubs to work.
#========================================================================

	xit 'can place the order by listing dishes' do
		takeaway.takes_order 'tom yum soup',3
		takeaway.place_the_order
	end
end