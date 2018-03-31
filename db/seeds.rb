# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:username => 'admin', :password => 'password',
          :admin => true, :cowboy => true, :handy => true, :doctor => true,
          :email => 'hjt486@gmail.com', :phone => '4803307059',
          :address => '5250 S Hardy Dr. APT 2022, Tempe, AZ 85283'}
  	 ]

users.each do |user|
  User.create!(user)
end
