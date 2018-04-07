# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:username => 'admin', :password => 'password',
        :admin => true, :cowboy => false, :handy => false, :doctor => false,
        :email => 'hjt486@gmail.com', :phone => '4803307059',
        :address => '5250 S Hardy Dr. APT 2022, Tempe, AZ 85283'},
        {:username => 'hjt486', :password => 'password',
        :admin => false, :cowboy => true, :handy => true, :doctor => true,
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'}
  	 ]

pens = [{:num => '1', :total_num => '100', :pull_num => '6', :dead_num => '2',
        :feed_check => false, :water_check => false, :mud_check => false, :maintenance_check => false},
        {:num => '2', :total_num => '101', :pull_num => '3', :dead_num => '1',
        :feed_check => false, :water_check => false, :mud_check => false, :maintenance_check => false}
       	 ]

users.each do |user|
  User.create!(user)
end

pens.each do |pen|
  Pen.create!(pen)
end
