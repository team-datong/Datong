User.destroy_all
User.create!([{email:'user1@datong.com', password: 'passwordpassword', fname: 'User', lname: 'Juan', is_account_admin:
    true, confirmed_at: DateTime.now}, {email:'user2@datong.com', password:'password', fname: 'User', lname: 'Tu'}])

p "Created #{User.count} users"