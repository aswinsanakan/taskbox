class AnnouncementsController < ApplicationController

	def index
		@announcements = Announcement.all
	end

	def new
		@announcement = Announcement.new
	end

	def create
		@announcement = Announcement.new(announcement_params)
		@announcement.user_id = current_user.id
		if @announcement.save
			Notification.announcement(@announcement).deliver
			redirect_to announcements_path, notice: "Successfully created!"
		else
			render action: "new"
		end
	end

	def show
		@announcement = Announcement.find(params[:id])
	end

	private

	def announcement_params
		params[:announcement].permit(:title, :body, :user_id)
	end
end
