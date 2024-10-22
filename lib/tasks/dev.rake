unless Rails.env.production?
  namespace :dev do
    desc "Drop, create, migrate, and add sample data"
    task reset: [
      :environment,
      "db:drop",
      "db:create",
      "db:migrate",
      "dev:sample_data"
    ]

    desc "Add sample data"
    task sample_data: :environment do

      puts "Creating directors..."
      10.times do
        Director.create!(
          name: Faker::Name.name,
          bio: Faker::Lorem.paragraph(sentence_count: 4),
          date_of_birth: Faker::Date.between(from: 100.years.ago, to: 18.years.ago)
        )
      end

      puts "Creating movies..."
      100.times do
        Movie.create!(
          director: Director.all.sample,
          title: Faker::Movie.title,
          year: Faker::Date.between(from: 100.years.ago, to: 18.years.ago).year.to_s
        )
      end

      puts "done"
    end
  end
end
