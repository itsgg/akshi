class AddOrderToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :order, :integer, default: 0, null: false
  end
end
