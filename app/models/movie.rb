# == Schema Information
#
# Table name: movies
#
#  id           :bigint           not null, primary key
#  title        :string
#  year         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  director_id  :bigint           not null
#  submitter_id :bigint
#
# Indexes
#
#  index_movies_on_director_id   (director_id)
#  index_movies_on_submitter_id  (submitter_id)
#
# Foreign Keys
#
#  fk_rails_...  (director_id => directors.id)
#  fk_rails_...  (submitter_id => users.id)
#
class Movie < ApplicationRecord
  belongs_to :director
  belongs_to :submitter, class_name: "User"
  has_many :likes, as: :likeable

  include PgSearch::Model
  multisearchable against: [:title, :year]

  def to_s
    "#{title} (#{year})"
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title", "year"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["director"]
  end
end
