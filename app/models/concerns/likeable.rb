module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable

    scope :order_by_popularity, -> { joins(:likes).group(:id).order("COUNT(likes.id) DESC") }
  end
end
