class CreateThemeMembers < ActiveRecord::Migration
  def change
    create_table :theme_members do |t|
      t.belongs_to :theme, index:true
      t.belongs_to :member, index:true
    end
  end
end
