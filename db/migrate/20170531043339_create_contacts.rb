class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :state
      t.string :job

      t.timestamps
    end
  end
end
