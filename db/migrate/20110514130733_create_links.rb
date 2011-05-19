class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :url,  :null => false
      t.integer :visits, :null => false, :default => 0

      t.timestamps
    end
    
    add_index :links, :url
    
  end

  def self.down
    remove_index :links, :url
    drop_table :links
  end
end
