class AddIndexForCardPages < ActiveRecord::Migration
  def change
    
    add_index :card_pages, :name  ,  :unique => true
    
  end
end
