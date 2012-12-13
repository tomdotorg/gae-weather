class AddFieldEtMetricsArchiveRecords < ActiveRecord::Migration
  def self.up
    add_column :archive_records, :et_m, :float 
  end

  def self.down
    remove_column :archive_records, :et_m, :float 
  end
end
