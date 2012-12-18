class ChangeFieldEtArchiveRecords < ActiveRecord::Migration
  def self.up
    change_column :archive_records, :et, :float
  end

  def self.down
    change_column :archive_records, :et, :integer
  end
end
