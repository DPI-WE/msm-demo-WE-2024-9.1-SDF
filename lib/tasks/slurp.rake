require "csv"

namespace :slurp do
  desc "Import directors from lib/csvs/directors.csv"
  task directors: :environment do
    # read the file into text
    csv_text = File.read(Rails.root.join("lib", "csvs", "directors.csv"))

    # load the text into CSV object
    csv = CSV.parse(csv_text, headers: true)

    count = 0
    # for each row in csv
    csv.each do |row|
      # puts row.to_hash
      # create a director
      # id,name,dob,bio,image,created_at,updated_at
      Director.create!(
        id: row["id"],
        name: row["name"],
        date_of_birth: row["dob"],
        bio: row["bio"]
      )
      count += 1
    end
    puts "Imported #{count} directors"
  end

  desc "Import movies from lib/csvs/movies.csv"
  task movies: :environment do
    csv_text = File.read(Rails.root.join("lib", "csvs", "movies.csv"))
    csv = CSV.parse(csv_text, headers: true)
    count = 0
    csv.each do |row|
      # id,title,year,duration,description,image,director_id,created_at,updated_at
      director = Director.find_by(id: row["director_id"])

      Movie.create!(
        id: row["id"],
        title: row["title"],
        year: row["year"],
        director: director
      )
      count += 1
    end
    puts "Imported #{count} movies"
  end
end
