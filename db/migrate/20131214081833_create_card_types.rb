class CreateCardTypes < ActiveRecord::Migration
  def change
    create_table :card_types do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
