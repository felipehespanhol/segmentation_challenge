class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments do |t|
      t.string :name
      t.string :operator, default: 'and'

      t.timestamps
    end
  end
end
