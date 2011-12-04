class AddStatusToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|

      t.string    :youtube_url
      t.text      :about_me
      t.string    :age
      t.string    :reject_reason
      t.text      :admin_notes
      t.boolean   :active, :default => true
      t.decimal   :rating_average_overall, :default => 0, :precision => 6, :scale => 2

    end
  end

  def self.down
      remove_column :users, :youtube_url
      remove_column :users, :about_me
      remove_column :users, :age
      remove_column :users, :reject_reason
      remove_column :users, :admin_notes 
      remove_column :users, :active
      remove_column :users, :rating_average_overall
  end
end
