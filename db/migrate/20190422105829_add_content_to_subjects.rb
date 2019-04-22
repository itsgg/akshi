class AddContentToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :content, :text, null: false
  end
end
