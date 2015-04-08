class AddNotesToUserDataFiles < ActiveRecord::Migration
  def change
    add_column :user_data_files, :notes, :string
  end
end
