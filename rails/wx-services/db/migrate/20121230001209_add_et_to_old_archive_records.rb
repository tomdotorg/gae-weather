class AddEtToOldArchiveRecords < ActiveRecord::Migration
  def self.up
    add_column :old_archive_records, :et_m, :integer
  end

  def self.down
    remove_column :old_archive_records, :et_m
  end
end
