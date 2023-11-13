class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :passenger, foreign_key: {to_table: :passengers}
      t.references :flight, foreign_key: {to_table: :flights}
    end
  end
end
