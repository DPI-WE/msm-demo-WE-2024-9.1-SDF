class MoviePolicy < ApplicationPolicy
  attr_reader :user, :movie

  def initialize(user, movie)
    @user = user
    @movie = movie
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    # TODO: allow admin
    movie.submitter == user
  end

  def destroy?
    # TODO: allow admin
    movie.submitter == user
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
