class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.date   :birthdate
      t.string :gender
      t.string :email
      t.boolean :email_messages

      t.timestamps
    end
  end
end
