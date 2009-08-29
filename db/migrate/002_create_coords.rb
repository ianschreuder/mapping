class CreateCoords < ActiveRecord::Migration
  def self.up
    create_table :coords do |t|
      t.column :x_utm, :float
      t.column :y_utm, :float
      t.column :latitude, :float
      t.column :longitude, :float
      t.timestamps
    end
  end

  def self.down
    drop_table :coords
  end
end
