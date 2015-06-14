class AddPageToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :page, :string
  end
end
