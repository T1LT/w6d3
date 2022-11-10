class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    # rename name
    # delete email
    rename_column :users, :name, :username
    remove_column :users, :email
  end
end
