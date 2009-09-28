# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "feeders", :force => true do |t|
    t.integer "substation_id"
    t.float   "lat"
    t.float   "long"
  end

  create_table "feeders_switches", :id => false, :force => true do |t|
    t.integer "feeder_id", :null => false
    t.integer "switch_id", :null => false
  end

  create_table "meters", :force => true do |t|
    t.integer "feeder_id"
    t.float   "lat"
    t.float   "long"
  end

  create_table "meters_switches", :id => false, :force => true do |t|
    t.integer "meter_id",  :null => false
    t.integer "switch_id", :null => false
  end

  create_table "substations", :force => true do |t|
    t.float "lat"
    t.float "long"
  end

  create_table "switches", :force => true do |t|
    t.float "lat"
    t.float "long"
  end

end
