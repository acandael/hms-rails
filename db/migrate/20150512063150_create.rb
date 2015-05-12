class Create < ActiveRecord::Migration
  def change
    create_table :member_publications do |t|
      t.belongs_to :member, index:true
      t.belongs_to :publication, index:true
    end
  end
end
