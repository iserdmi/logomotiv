# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
User.create(:username => 'admin', :password => 'admin', :email => 'sman2d@gmail.com')
Branch.create(:title => 'Институты, гос. учреждения') 
Branch.create(:title => 'Промышленность')
Branch.create(:title => 'Ритэйл')
Branch.create(:title => 'Услуги')
Branch.create(:title => 'Издания')
Branch.create(:title => 'Выставки')
