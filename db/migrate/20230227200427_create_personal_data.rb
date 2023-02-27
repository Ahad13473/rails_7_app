class CreatePersonalData < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_data do |t|
      t.string :first_name, null: false, limit: 25
      t.string :last_name, null: false, limit: 50
      t.string :nickname
      t.string :email_address, null: false
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end
