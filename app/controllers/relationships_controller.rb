class RelationshipsController < ApplicationController
	def show
	end

	def index
	end

	def create
		user = User.find(params[:user_id])
		relationship = current_user.relationships.new(user_id: user.id)
		relationship.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		user = User.find(params[:user_id])
		relationship = current_user.relationships.find_by(user_id: user.id)
		relationship.destroy
		redirect_back(fallback_location: root_path)
	end
end
