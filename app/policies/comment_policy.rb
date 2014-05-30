class CommentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end

    def destroy?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
    end
  end
end