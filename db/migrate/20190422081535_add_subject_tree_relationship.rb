class AddSubjectTreeRelationship < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :parent_id, :integer
  end
end
