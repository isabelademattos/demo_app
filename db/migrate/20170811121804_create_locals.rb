class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :address
      t.string :number
      t.string :compl
      t.string :district
      t.string :city
      t.string :state
      t.string :zip
      t.integer :user_id

      t.timestamps
    end
    add_index :locals, [:user_id, :created_at]
  end
end
