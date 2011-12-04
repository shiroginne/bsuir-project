# -*- coding: utf-8 -*-
User.new(:email => 'admin@example.com', :password => 'admin', :first_name => "Админ", :last_name => "Админов", :middle_name => "Админович").tap do |user|
  user.confirmed_at = Time.now
  user.role = :admin
end.save!

fitu = Faculty.create!(:abbr_name => 'ФИТиУ', :full_name => 'Факультет информационных технологий и управления')
ksis = Faculty.create!(:abbr_name => 'ФКСиС', :full_name => 'Факультет компьютерных систем и сетей')

Speciality.create!(:abbr_name => 'АСОИ', :full_name => 'Автоматизированные системы обработки информации', :faculty => fitu)
Speciality.create!(:abbr_name => 'ИИ', :full_name => 'Искуственный интеллект', :faculty => fitu)

Speciality.create!(:abbr_name => 'ВМСиС', :full_name => 'Вычислительные машины, системы и сети', :faculty => ksis)
