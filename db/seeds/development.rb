User.destroy_all
User.create!([{email:'user1@datong.com', password: 'passwordpassword'}, {email:'user2@datong.com', password:'password'}])

p "Created #{User.count} users"