class BookingPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
