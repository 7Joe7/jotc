class AddCreatedAtToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :created_at, :datetime
  end
end
