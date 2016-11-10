module Api
	module V1
		class ClientsController < ApplicationController
			def show
				@client = current_user.clients.find(params[:id])
			end
		end
	end
end