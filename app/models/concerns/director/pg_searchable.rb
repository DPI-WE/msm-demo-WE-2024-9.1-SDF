module Director::PgSearchable
  extend ActiveSupport::Concern
  include PgSearch::Model

  included do
    multisearchable against: [:name, :bio]
  end
end
