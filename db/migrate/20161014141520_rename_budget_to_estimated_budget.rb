class RenameBudgetToEstimatedBudget < ActiveRecord::Migration
  def change
  	rename_column :projects, :budget, :estimated_budget
  end
end
