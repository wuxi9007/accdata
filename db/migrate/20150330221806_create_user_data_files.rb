class CreateUserDataFiles < ActiveRecord::Migration
  def self.up
    create_table :user_data_files do |t|
      t.column :filename, :string
      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :user_data_files
  end
end
