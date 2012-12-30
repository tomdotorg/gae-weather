class AddVilibilityMToNoaaConditions < ActiveRecord::Migration
  def self.up
    add_column :noaa_conditions, :visibility_m, :integer
  end

  def self.down
    remove_column :noaa_conditions, :visibility_m
  end
end
