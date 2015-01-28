class AddRepetitionToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :repeat, :boolean
  end
end
