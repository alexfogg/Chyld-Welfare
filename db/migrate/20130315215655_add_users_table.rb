class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :is_donor
      t.boolean :is_app
      t.text :bio
      t.text :photo
      t.timestamps
    end
  end
end