class AddNameAndSphereToNews < ActiveRecord::Migration
  def change
    add_column :news, :name, :string
    add_column :news, :sphere, :integer
  end
end
