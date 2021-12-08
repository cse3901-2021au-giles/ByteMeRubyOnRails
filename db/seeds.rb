# Create a main sample user.
User.create!(first_name: "Example",
             last_name: "User",
             email: "example@railstutorial.org",
             user_type: "professor",
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
ClassSession.create!(name: "Example Class 1")
UserClassXRef.create(user_id: 1, class_session_id: 1)
UserClassXRef.create(user_id: 2, class_session_id: 21)
UserClassXRef.create(user_id: 3, class_session_id: 1)
ClassSession.create!(name: "Example Class 1")
UserClassXRef.create(user_id: 2, class_session_id: 1)
ClassSession.create!(name: "Example Class 2")
UserClassXRef.create(user_id: 1, class_session_id: 2)
# Create a main sample group.
Group.create!(name: "Example Group 1",
              class_session_id: 1)
Group.create!(name: "Example Group 2",
                            class_session_id: 2)
UserGroupXRef.create(user_id:1, group_id:1)
UserGroupXRef.create(user_id:2, group_id:1)
UserGroupXRef.create(user_id:3, group_id:1)
# Create a main sample project.
Project.create!(name: "Example Project 1",
              class_session_id: 1, group_id:1)
Project.create!(name: "Example Project 2",
              class_session_id: 2, group_id:2)

Evaluation.create(evaluator_id:2, evaluatee_id: 2, score:0, assessment:"ok", group_id:1, project_id:1)