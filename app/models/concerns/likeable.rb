module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable

    scope :order_by_popularity, -> { joins(:likes).order("COUNT(likes.id) DESC") }
  end
end
