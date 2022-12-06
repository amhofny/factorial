class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end

    add_index :contacts, :email, unique: true
  end
end
