class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments do |t|
      t.string :name
      t.string :conditions
      t.string :operators

      t.timestamps
    end
  end
end
