class RemoveCommentNameField < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :name
  end
end
