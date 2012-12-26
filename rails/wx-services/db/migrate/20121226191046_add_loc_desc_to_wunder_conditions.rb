class AddLocDescToWunderConditions < ActiveRecord::Migration
  def self.up
    add_column :wunder_conditions, :location_desc, :string
    add_column :noaa_conditions, :location_desc, :string
  end

  def self.down
    remove_column :wunder_conditions, :location_desc
    remove_column :noaa_conditions, :location_desc
  end
end
