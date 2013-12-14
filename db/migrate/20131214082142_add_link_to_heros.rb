class AddLinkToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :link, :string
  end
end
