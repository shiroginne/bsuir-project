User.new.tap do |user|
  user.email = 'admin@example.com'
  user.password = 'Admin1'
  user.confirmed_at = Time.now

  user.role = :admin
end.save!
