# -*- coding: utf-8 -*-
User.new(:email => 'admin@example.com', :password => 'admin', :first_name => "Админ", :last_name => "Админов", :middle_name => "Админович").tap do |user|
  user.confirmed_at = Time.now
  user.role = :admin
end.save!

fitu = Faculty.create!(:abbr_name => 'ФИТиУ', :full_name => 'Факультет информационных технологий и управления')
ksis = Faculty.create!(:abbr_name => 'ФКСиС', :full_name => 'Факультет компьютерных систем и сетей')

asoi = Speciality.create!(:abbr_name => 'АСОИ', :full_name => 'Автоматизированные системы обработки информации', :faculty => fitu)
ii = Speciality.create!(:abbr_name => 'ИИ', :full_name => 'Искуственный интеллект', :faculty => fitu)
vmsis = Speciality.create!(:abbr_name => 'ВМСиС', :full_name => 'Вычислительные машины, системы и сети', :faculty => ksis)

Group.create!(:number => '720601', :speciality => asoi)
Group.create!(:number => '720602', :speciality => asoi)
Group.create!(:number => '720603', :speciality => asoi)
Group.create!(:number => '720604', :speciality => asoi)
Group.create!(:number => '720501', :speciality => ii)
Group.create!(:number => '720502', :speciality => ii)
Group.create!(:number => '720503', :speciality => ii)
