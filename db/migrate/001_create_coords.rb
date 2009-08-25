class CreateCoords < ActiveRecord::Migration
  def self.up
    create_table :coords do |t|
      t.column :x_utm, :string
      t.column :y_utm, :string
      t.column :latitude, :string
      t.column :longitude, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :coords
  end
end
