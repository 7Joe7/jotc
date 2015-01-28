class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :time_from
      t.datetime :time_to
      t.references :user, index: true
      t.string :place

      t.timestamps
    end
  end
end
