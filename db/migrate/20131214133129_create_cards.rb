class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :english_name
      t.string :link
      t.string :img_link
      t.string :description
      t.string :profession
      t.string :type
      t.string :card_type
      t.integer :cost
      t.integer :attack
      t.integer :health

      t.timestamps
    end
  end
end
