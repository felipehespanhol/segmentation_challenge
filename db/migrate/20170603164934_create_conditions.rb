class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.string :field
      t.string :name
      t.string :term
      t.references :segment, foreign_key: true

      t.timestamps
    end
  end
end
