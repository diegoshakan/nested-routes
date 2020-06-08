class RenameDescriptionOfComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :description, :description_content
  end
end
