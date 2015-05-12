class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :title
      t.text :description
    end
  end
end
