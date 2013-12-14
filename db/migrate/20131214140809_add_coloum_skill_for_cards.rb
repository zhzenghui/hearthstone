class AddColoumSkillForCards < ActiveRecord::Migration
  def change
    add_column :cards , :power , :string
    add_index :cards, :name ,       :unique => true
    
  end
end
