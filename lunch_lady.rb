require 'pry'
@final_order = []


# def hash
# 	@restaurant_menu = {"Meat Loaf" => 3, "Pizza" => 2, "Hot Dog" => 3}
# 	# @restaurant_menu.each do | item, price |
# 	puts "#{item}: $#{price}"
# end

def sides
	puts "Now, please select from the list of sides:"
	puts ">enter '1' for carrots\n>enter '2' for yogurt\n>enter '3' for grits"
	@sides_input = gets.strip.to_i
	if @sides_input == 1
		@final_order << "carrots" 
		puts 'You have selected carrots... Here is your order:'
		puts exit_page
	elsif @sides_input == 2
		@final_order << 'yogurt'
		puts 'You have selected yogurt... Here is your order:'
		puts exit_page
	elsif @sides_input ==3
		@final_order << 'grits'
		puts 'You have selected grits. Here is your order:'
		puts exit_page
	else
		puts "invalid selection: please try again..."
		puts sides
	end
end

def checkout
	@total_count = ["$10", "$8", "$6", "$9"]
	puts '-' * 10
	puts "Thank you for shopping at the DPL Cafe. Your total is:"
	puts '-' * 10
	puts @total_count.sample
end

def exit_page
	puts "*" * 10
	@final_order.each do |total|
		puts "#{total}"
	end	
	puts '*' * 10 
	puts "type 'c'to checkout:"
	puts "type 'e' to return to the main menu and start over"
	@user_input = gets.strip.downcase
	if @user_input == "c"
		puts checkout			
	elsif @user_input == "e"
		puts welcome_menu 
	end
end

def item_descriptions
	puts '-' * 10
	puts"> Meat Loaf: A mystery meat substance derived from actual meat by-products--400 calories"	
	puts"> Pizza: A heavenly combination of dough, marinara, cheese and pepperoni that some say rival the invention of the wheel-- 250 calories "
	puts"> Hot Dog: See Meat Loaf description above for information--300 calories."
	puts"> Carrots: Cylindrical orange vegtables generally considered as a healthy food alternative...or solid projectile to throw at your brother--75 calories"
	puts"> Yogurt: You had no childhood if you dont know what this is--175 calories" 
	puts"> Grits: A southern, grain-based side-dish that cannot be consumed without a proper 'yee-haw!'--135 calories"
	puts '-' * 10 
	puts "press '1' to return to main menu"
	@user_input_2 = gets.strip.to_i
	if @user_input_2 == 1
		puts welcome_menu
	else 
		puts "invalid selection. Please try again:" 
		puts item_descriptions
	end
end

def welcome_menu
	puts '-' * 15
	puts '*****Welcome To The DPL Lunch Lab*****'
	puts 'Here Are Your Options:'
	puts "> Pressing '1' will bring up a list of entrees, then you will select a side dish"
	puts "> Pressing '2' will bring up a list of the food items, their content descriptions and calorie levels"
	puts "> pressing '3' will allow you to reset the menu options and start over"
	@main_menu_selection = gets.strip.to_i
	if @main_menu_selection == 1
		puts 'Here are your Entrees:'
		puts "> Enter '4' for Meat Loaf"
		puts "> Enter '5' for Pizza"
		puts "> Enter '6' for Hot Dog"
		@entree_selection = gets.strip.to_i
		if @entree_selection == 4
			@final_order << "meat loaf"
			sides
		elsif @entree_selection == 5
			@final_order << "pizza"
		 	sides
		elsif @entree_selection == 6
			@final_order << "hot dog"
		 	sides
		end
	elsif @main_menu_selection == 2
		puts item_descriptions
	elsif @main_menu_selection == 3 
		puts welcome_menu
	else	
		puts 'Invalid option. Please select again'
		welcome_menu
	end
end


def entry
	puts "You have $17 credit available in your lunch account"
	puts "Your total credit will be tallied at checkout"
	puts "press enter to continue"
	gets
	puts welcome_menu
end

answer = ''
while answer != 'quit'
	puts '-' * 10
	puts "Should you like to quit at any time, you may type 'quit'"
	puts "otherwise, press enter to continue on"
	answer = gets.strip.downcase.to_i
	entry
	welcome_menu
end


#why do the entrees only get stored as meat loaf and nothing else gets registered. the sides register just fine