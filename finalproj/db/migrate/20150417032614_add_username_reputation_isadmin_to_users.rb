class AddUsernameReputationIsadminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :reputation, :integer, default: 0
    add_column :users, :isadmin, :boolean, default: false
  end
end
