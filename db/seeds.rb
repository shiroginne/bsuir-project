# -*- coding: utf-8 -*-
User.new(:email => 'admin@example.com', :password => 'admin', :first_name => "Админ", :last_name => "Админов", :middle_name => "Админович").tap do |user|
  user.confirmed_at = Time.now
  user.role = :admin
end.save!

Faculty.create!(:abbr_name => 'ФИТиУ', :full_name => 'Факультет информационных технологий и управления')
Faculty.create!(:abbr_name => 'ФКСиС', :full_name => 'Факультет компьютерных систем и сетей')
