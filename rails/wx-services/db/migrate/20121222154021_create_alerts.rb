class CreateAlerts < ActiveRecord::Migration
  def self.up
    create_table :alerts do |t|
      t.string :location
      t.string :atype
      t.string :phenomena
      t.datetime :date
      t.datetime :expires
      t.string :description
      t.text :message
      t.string :significance
      t.string :wtype_meteoalarm
      t.string :wtype_meteoalarm_name
      t.string :level_meteoalarm
      t.string :level_meteoalarm_name
      t.string :level_meteoalarm_description
      t.string :attribution
      t.timestamps
    end
    add_index :alerts, :location
    add_index :alerts, :expires
    add_index :alerts, :date
  end

  def self.down
    drop_table :alerts
  end
end
