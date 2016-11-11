class TasksController < ApplicationController

	def create
		@task = Task.new(task_params)
		if @task.save
			redirect_to project_path(@task.project_id), notice: "Succcessfully created task!"
		end
	end

	def update
		@task = Task.find(params[:id])
		if @task.update_attributes(task_params)
			if @task.is_completed == true
			Notification.task_completed(@task).deliver
			redirect_to :back, notice: "Successfully marked complete"
			else 
			Notification.task_reopened(@task).deliver
			redirect_to :back, notice: "Successfully reopened!"
			end
		end
	end

	def mark_as_complete
		task = Task.find(params[:task_id])
		task.update_attributes(is_completed: true)
		Notification.task_completed(task).deliver
		redirect_to :back, notice: "Successfully completed task"
	end

	def mark_as_incomplete
		task = Task.find(params[:task_id])
		task.update_attributes(is_completed: false)
		Notification.task_reopened(task).deliver
		redirect_to :back, notice: "Successfully marked as incomplete"
	end

	private

	def task_params
		params[:task].permit(:title, :project_id, :due_date, :is_completed)
	end
end
