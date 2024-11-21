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
  include Likeable, MetaTaggable, PgSearchable, Ransackable

  belongs_to :director
  accepts_nested_attributes_for :director, reject_if: :all_blank
  belongs_to :submitter, class_name: "User", optional: true

  has_one_attached :poster

  def to_s
    "#{title} (#{year})"
  end
end
