class CreateCardPages < ActiveRecord::Migration
  def change
    create_table :card_pages do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
