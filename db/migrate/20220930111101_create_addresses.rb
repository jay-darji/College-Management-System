class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :houseNo
      t.string :nameOfSocietyOrAppartment
      t.string :landmark
      t.string :city
      t.string :district
      t.string :state
      t.string :nation
      t.string :postalCode

      t.timestamps
    end
  end
end
