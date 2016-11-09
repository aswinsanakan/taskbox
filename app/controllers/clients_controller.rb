class ClientsController < ApplicationController


	before_action :authenticate_user!
	def index
		@clients = current_user.clients
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		@client.user_id = current_user.id
		if @client.save #passes validation - clients_path returns "/clients"
			redirect_to clients_path, notice: "Successfully created client"
		else #display error messages
			render action: "new"
		end
	end

	def show
		
		begin
		@client = current_user.clients.find(params[:id])
		#@projects = Project.where('client_id = ?', @client.id)
		#Instead using has_many association, we use @client.projects in client model
		@projects = @client.projects
		@new_projects = @projects.where('status = ?', "new")
		@ongoing_projects = @projects.where('status = ?', "on-going")
		@completed_projects = @projects.where('status = ?', "completed")
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path, notice: "RECORD NOT FOUND"
		end
		#Error Handling for invalid client ids
	end

	def edit
		@client = Client.find(params[:id])
	end

	def update
		@client = Client.find(params[:id])
		@client.user_id = current_user.id
		if @client.update_attributes(client_params)
			redirect_to client_path(@client), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy
		redirect_to clients_path, notice: "Destroyed successfully!"
	end

	def export
		@clients = current_user.clients
	end

	def export_each_client
		@client = current_user.clients.find(params[:client_id])
		@projects = @client.projects
	end

	private

	def client_params
		params[:client].permit(:name, :mobile,:website,:company, :email)
	end
end
