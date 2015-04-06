class DropUserDataFile < ActiveRecord::Migration
  def change
  	drop_table :user_data_files;
  end
end
