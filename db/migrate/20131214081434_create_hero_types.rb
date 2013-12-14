class CreateHeroTypes < ActiveRecord::Migration
  def change
    create_table :hero_types do |t|
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
