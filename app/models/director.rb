# == Schema Information
#
# Table name: directors
#
#  id            :bigint           not null, primary key
#  bio           :text
#  date_of_birth :datetime
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Director < ApplicationRecord
  has_many :likes, as: :likeable

  include PgSearch::Model
  multisearchable against: [:name, :bio]

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  def to_s
    "#{name} (#{date_of_birth.year})"
  end
end
