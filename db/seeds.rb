# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:username => 'admin', :password => 'password',
        :admin => '1', :cowboy => '0', :handy => '0', :doctor => '0',
        :first_name => 'Ted', :last_name => 'Hahn',
        :email => 'hjt486@gmail.com', :phone => '4803307059',
        :address => '5250 S Hardy Dr. APT 2022, Tempe, AZ 85283'},

        {:username => 'user1', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '1', :doctor => '1',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user2', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '1', :doctor => '0',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user3', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '0', :doctor => '1',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user4', :password => 'password',
        :admin => '0', :cowboy => '0', :handy => '1', :doctor => '1',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user5', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '0', :doctor => '0',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user6', :password => 'password',
        :admin => '0', :cowboy => '0', :handy => '1', :doctor => '0',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user7', :password => 'password',
        :admin => '0', :cowboy => '0', :handy => '0', :doctor => '1',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
  	   ]

pens = [{:num => '1', :total_num => '100'},
        {:num => '2', :total_num => '100'},
        {:num => '3', :total_num => '100'},
        {:num => '4', :total_num => '100'},
        {:num => '5', :total_num => '100'},
        {:num => '6', :total_num => '100'},
        {:num => '7', :total_num => '100'},
        {:num => '8', :total_num => '100'},
        {:num => '9', :total_num => '100'},
        {:num => '10', :total_num => '100'},
        {:num => '11', :total_num => '100'},
        {:num => '12', :total_num => '100'}
       	 ]

users.each do |user|
  User.create!(user)
end

pens.each do |pen|
  Pen.create!(pen)
end
