class Takeaway
	attr_reader :current_order
	def initialize
		@menu = {
			'tom_yum_soup' => 4, 
			'kung pow chicken' => 6, 
			'hamburger' => 3
			'coconut rice' => 3
		}
		@current_order = {}
	end

	def list_price menu_item
		@menu[menu_item.to_sym]
	end

	def takes_order menu_item,quantity
		@current_order[menu_item] = quantity
	end

	def list_order 
	end



end