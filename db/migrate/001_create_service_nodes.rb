class CreateServiceNodes < ActiveRecord::Migration
  def self.up

    create_table :turbines do |t|
      t.column :label, :string
      t.column :lat, :float, :limit => 25
      t.column :long, :float, :limit => 25
    end

    create_table :turbine_forecasts do |t|
      t.column :turbine_id, :integer
      t.column :iso_date, :datetime
      t.column :hourly_ws, :float, :limit => 25
      t.column :created_at, :datetime
      t.column :verify_day, :integer
      t.column :verify_hour, :integer
      t.column :lead_time, :integer
      t.column :forecast, :float, :limit => 25
      t.column :observed, :float, :limit => 25
      t.column :error, :float, :limit => 25
    end
  end

  def self.down
  end
end
