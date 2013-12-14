class AddIndex < ActiveRecord::Migration
  def change
    add_index :card_types, :name  ,  :unique => true
    add_index :hero_types, :name ,  :unique => true
    add_index :heros, :name ,       :unique => true
  end
end
