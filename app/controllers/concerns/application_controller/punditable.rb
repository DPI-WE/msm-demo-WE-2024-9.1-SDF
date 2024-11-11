module ApplicationController::Punditable
  extend ActiveSupport::Concern

  include Pundit::Authorization
end
