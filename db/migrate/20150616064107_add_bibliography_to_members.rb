class AddBibliographyToMembers < ActiveRecord::Migration
  def change
    add_column :members, :bibliography, :string
  end
end
