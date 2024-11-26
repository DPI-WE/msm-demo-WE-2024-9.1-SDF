# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

emails = ["ihera2@uillinois.edu", "ihera2@illinois.edu", "ihera2@uic.edu"]

emails.each do |email|
  User.create(
    email: email,
    password: Rails.application.credentials.admin_password,
    admin: true
  )
end
