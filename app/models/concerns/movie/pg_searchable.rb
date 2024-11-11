module Movie::PgSearchable
  extend ActiveSupport::Concern
  include PgSearch::Model

  included do
    multisearchable against: [:title, :year]
  end
end
