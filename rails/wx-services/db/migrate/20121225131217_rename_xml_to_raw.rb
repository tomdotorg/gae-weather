class RenameXmlToRaw < ActiveRecord::Migration
  def self.up
    rename_column :wunder_conditions, :conditions_xml, :conditions_raw
  end

  def self.down
    rename_column :wunder_conditions, :conditions_raw, :conditions_xml
  end
end
