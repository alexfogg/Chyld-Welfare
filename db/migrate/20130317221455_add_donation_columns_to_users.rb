class AddDonationColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :donatename, :string
    add_column :users, :donateamt, :float
  end
end