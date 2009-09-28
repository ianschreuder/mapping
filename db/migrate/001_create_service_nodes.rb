class CreateServiceNodes < ActiveRecord::Migration
  def self.up
    
    create_table :substations do |t|
      t.column :lat, :float, :limit => 25
      t.column :long, :float, :limit => 25
    end

    create_table :feeders do |t|
      t.column :substation_id, :integer
      t.column :lat, :float, :limit => 25
      t.column :long, :float, :limit => 25
    end

    create_table :meters do |t|
      t.column :feeder_id, :integer
      t.column :lat, :float, :limit => 25
      t.column :long, :float, :limit => 25

    end
    create_table :switches do |t|
      t.column :lat, :float, :limit => 25
      t.column :long, :float, :limit => 25
    end

    create_table :meters_switches, :id => false do |t|
      t.column :meter_id, :integer, :null => false
      t.column :switch_id, :integer, :null =>false
    end

    create_table :feeders_switches, :id => false do |t|
      t.column :feeder_id, :integer, :null => false
      t.column :switch_id, :integer, :null =>false
    end

  end

  def self.down
  end
end
