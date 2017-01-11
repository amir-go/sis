class RemoveEvaluationFromSignups < ActiveRecord::Migration
  def change
  	remove_column :signups, :evaluation
  end
end
