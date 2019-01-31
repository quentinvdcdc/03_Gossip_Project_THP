# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
	city = City.create!(name: Faker::LeagueOfLegends.location,zip_code: Faker::Number.number(5))
end

10.times do
	user = User.create!(first_name: Faker::Lebowski.character,last_name: Faker::LordOfTheRings.character,description: Faker::Lorem.sentence,age: Faker::Number.number(2),email: Faker::Internet.email,city_id: rand(City.ids.first..City.ids.last))
end

20.times do
	gossip = Gossip.create!(title: Faker::SiliconValley.app,content: Faker::SiliconValley.motto,user_id: rand(User.ids.first..User.ids.last))
end

10.times do
	tag = Tag.create!(title: Faker::Book.genre)
end

20.times do |i|
	rand(Tag.ids.first..Tag.ids.last).times do
		join_table_gossip_tag = JoinTableGossipTag.create!(gossip_id: Gossip.find(i+1).id,tag_id: rand(Tag.ids.first..Tag.ids.last))
	end
end

15.times do
	private_message = PrivateMessage.create!(content: Faker::SiliconValley.motto,sender_id: rand(User.ids.first..User.ids.last))
	#sender_a = User.find(rand(User.ids.first..User.ids.last))
	#private_message.sender = sender_a
end

25.times do
	join_table_user_private_message = JoinTableUserPrivateMessage.create!(private_message_id: rand(PrivateMessage.ids.first..PrivateMessage.ids.last),recipient_id: rand(User.ids.first..User.ids.last))
end


