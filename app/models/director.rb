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
end
