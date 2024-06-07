class ProductPolicy < ApplicationPolicy
  class Scope < Scope
  #   # NOTE: Be explicit about which records you allow access to!
    def resolve
     scope
    end
  end
  def new?
    user.admin?
  end

  def create?
    user.admin?
  end
end
