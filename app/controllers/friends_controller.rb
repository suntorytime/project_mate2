class FriendsController < ApplicationController
	before_action :authenticate_user!

	def index
		@friends = current_user.friends
	end

	def new
		@friend = Friend.new
	end

	def create
		@friend = current_user.friends.build(friend_params)

		@friend.save
		redirect_to @friend
	end

	def show
		@friend = Friend.find(params[:id])
	end

	def edit
		@friend = Friend.find(params[:id])
	end

	def update
		@friend = Friend.find(params[:id])

		if @friend.update(friend_params)
			redirect_to @friend
		else
			render 'edit'
		end
	end

	def destroy
		@friend = Friend.find(params[:id])
		@friend.destroy

		redirect_to friends_path
	end

	private
	def friend_params
		params.require(:friend).permit(
			:name,
			:city,
			:profession,
			:inspirations,
			:likes,
			:accomplishments,
			:notes)
	end
end
