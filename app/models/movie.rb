# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  title       :string
#  year        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :bigint           not null
#
# Indexes
#
#  index_movies_on_director_id  (director_id)
#
# Foreign Keys
#
#  fk_rails_...  (director_id => directors.id)
#
class Movie < ApplicationRecord
  belongs_to :director

  def to_s
    "#{title} (#{year})"
  end
end
