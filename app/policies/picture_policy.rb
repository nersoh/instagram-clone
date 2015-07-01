class PicturePolicy < ApplicationPolicy

	def index?
		user
	end

	def show?
		user
	end

	def new?
		user
	end

	def create?
		user
	end

	def update?
		user.id == record.user_id
	end

	def destroy?
		user.id == record.user_id
	end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
