# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [{:username => 'admin', :password => 'password',
        :admin => '1', :cowboy => '0', :handy => '0', :doctor => '0',
        :first_name => 'Courtney', :last_name => 'Daigle',
        :email => 'cdaigle@tamu.edu', :phone => '9798629171',
        :address => 'Department of Animal Science'},

        {:username => 'user1', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '1', :doctor => '1',
        :first_name => 'Lynd', :last_name => 'Daigle',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user2', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '1', :doctor => '0',
        :first_name => 'Jiatai', :last_name => 'Han',
        :email => 'hjt486@gmail.com', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user3', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '0', :doctor => '1',
        :first_name => 'Qianzhen', :last_name => 'Li',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user4', :password => 'password',
        :admin => '0', :cowboy => '0', :handy => '1', :doctor => '1',
        :first_name => 'Huiqing', :last_name => 'Wang',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user5', :password => 'password',
        :admin => '0', :cowboy => '1', :handy => '0', :doctor => '0',
        :first_name => 'Ruogu', :last_name => 'Wang',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user6', :password => 'password',
        :admin => '0', :cowboy => '0', :handy => '1', :doctor => '0',
        :first_name => 'Aoran', :last_name => 'Xu',
        :email => 'jiataihan@tamu.edu', :phone => '4807889687',
        :address => '523 Southwest Parkway APT 104, College Station, TX 77840'},
        {:username => 'user7', :password => 'password',
        :admin => '0', :cowboy => '0', :handy => '0', :doctor => '1',
        :first_name => 'Zhiqiu', :last_name => 'Xu',
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

activities = [{:user_id => '2',
              :pen_id => '1',
              :check_in => '2017-05-29 10:00:00.000000',
              :created_at => '2017-05-29 10:15:00.000000',
              :updated_at => '2017-05-29 10:15:00.000000',
              :pen_pull_num => '5',
              :pen_dead_num => '1',
              :pen_feed_check => '1',
              :pen_water_check => '1',
              :pen_mud_check => '1',
              :pen_maintenance_check => '1'},
              {:user_id => '2',
              :pen_id => '2',
              :check_in => '2017-05-30 11:00:00.000000',
              :created_at => '2017-05-30 11:15:00.000000',
              :updated_at => '2017-05-30 11:15:00.000000',
              :pen_pull_num => '2',
              :pen_dead_num => '3',
              :pen_feed_check => '0',
              :pen_water_check => '1',
              :pen_mud_check => '0',
              :pen_maintenance_check => '0'},
        ]

users.each do |user|
  User.create!(user)
end

pens.each do |pen|
  Pen.create!(pen)
end

activities.each do |activity|
  Activity.create!(activity)
end
