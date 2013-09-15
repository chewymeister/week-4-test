require 'twilio-ruby'

class Takeaway
	attr_reader :current_order
	def initialize
		@menu = {
			'tom yum soup' => 4, 
			'kung pow chicken' => 6, 
			'hamburger' => 3,
			'coconut rice' => 3
		}
		@current_order = {}
		@sub_total = 0
		@message = ''
	end

	def list_price menu_item
		@menu[menu_item]
	end

	def takes_order menu_item,quantity
		@current_order[menu_item] = quantity
	end

	def list_current_order
		@current_order
	end

	def current_order_subtotal
		@current_order.each do |item, quantity|
			price = list_price(item) * quantity
			@sub_total += price
		end
		@sub_total
	end

	def place_the_order
		@current_order.each do |item, quantity|
			@message += "You ordered #{quantity} portions of #{item}"
		end
		@message += " Your sub total comes to £#{current_order_subtotal}.00."

		send_text my_twilio_client
	end

	def my_twilio_client
		account_sid = 'ACfc7164d64728e5bbc53a256c8f1abe77'
		auth_token = 'dfc72f20a828d8fb57cbc87f9291d2be'
		client = Twilio::REST::Client.new(account_sid, auth_token)
	end

	def send_text client
		
		client.account.sms.messages.create(
		  :from => '+441904500952',
		  :to => '+447735989592',
		  :body => @message)
	end

end