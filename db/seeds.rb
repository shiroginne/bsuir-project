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
g603 = Group.create!(:number => '720603', :speciality => asoi)
Group.create!(:number => '720604', :speciality => asoi)
Group.create!(:number => '720501', :speciality => ii)
Group.create!(:number => '720502', :speciality => ii)
Group.create!(:number => '720503', :speciality => ii)

vm = Subject.create!(:full_name => 'Высшая математика', :abbr_name => 'ВМ')
aipos = Subject.create!(:full_name => 'АИПОсик', :abbr_name => 'АИПОС')
llh = Subject.create!(:full_name => 'Лось лыжи харакири', :abbr_name => 'ЛЛХ')

term1 = Term.create!(:start_date => Time.local(2011, 9).to_date, :end_date => Time.local(2012, 1).to_date)
term0 = Term.create!(:start_date => Time.local(2011, 1).to_date, :end_date => Time.local(2011, 6).to_date)

SpecialitySubjectTerm.create!(:term => term0, :subject => vm, :speciality => asoi)
SpecialitySubjectTerm.create!(:term => term1, :subject => vm, :speciality => asoi)

SpecialitySubjectTerm.create!(:term => term0, :subject => vm, :speciality => ii)
SpecialitySubjectTerm.create!(:term => term1, :subject => vm, :speciality => ii)

SpecialitySubjectTerm.create!(:term => term0, :subject => llh, :speciality => ii)
SpecialitySubjectTerm.create!(:term => term1, :subject => aipos, :speciality => asoi)

Student.create!(:first_name => 'Петр', :last_name => 'Петров', :middle_name => 'Петрович', :group => g603)
Student.create!(:first_name => 'Иван', :last_name => 'Иванченко', :middle_name => 'Петрович', :group => g603)
Student.create!(:first_name => 'Игорь', :last_name => 'Игорев', :middle_name => 'Петрович', :group => g603)
