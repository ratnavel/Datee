class AddContactInfoToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.string    :first_name, :null => false
      t.string    :last_name, :null => false
      t.date      :dob
      t.string    :password_salt
      t.string    :gender
      t.boolean   :is_admin, :default => false
      t.string    :address1, :null => false
      t.string    :address2
      t.string    :city, :null => false
      t.string    :state, :null => false
      t.string    :zip, :null => false
      t.string    :country, :null => false
      t.string    :phone
      t.string    :cell
      t.decimal   :lat, :precision => 15, :scale => 10
      t.decimal   :lng, :precision => 15, :scale => 10      
    end
  end

  def self.down
      remove_column :users, :first_name
      remove_column :users, :last_name
      remove_column :users, :password_salt
      remove_column :users, :gender
      remove_column :users, :is_admin
      remove_column :users, :address1
      remove_column :users, :address2
      remove_column :users, :city
      remove_column :users, :state
      remove_column :users, :zip
      remove_column :users, :country
      remove_column :users, :phone
      remove_column :users, :cell
      remove_column :users, :lat
      remove_column :users, :lng
  end
end
