class AddEvaluationToSignups < ActiveRecord::Migration
  def change
  	add_column :signups, :evaluation, :integer
  end
end
