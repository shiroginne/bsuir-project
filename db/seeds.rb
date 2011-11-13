# -*- coding: utf-8 -*-
User.new(:email => 'admin@example.com', :password => 'Admin1', :first_name => "Админ", :last_name => "Админов", :middle_name => "Админович").tap do |user|
  user.confirmed_at = Time.now
  user.role = :admin
end.save!
