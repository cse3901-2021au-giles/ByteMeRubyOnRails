# Create a main sample user.
User.create!(first_name: "Example",
             last_name: "User",
             email: "example@railstutorial.org",
             password:              "password",
             password_confirmation: "password")

# Generate a bunch of additional users.
99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(first_name: first_name,
               last_name: last_name,
               email: email,
               password:              password,
               password_confirmation: password)
end
# Create a main sample class session.
ClassSession.create!(name: "Example Class")
# Create a main sample group.
Group.create!(name: "Example Group",
              class_session_id: 1)
# Create a main sample project.
Project.create!(name: "Example Project",
              class_session_id: 1)