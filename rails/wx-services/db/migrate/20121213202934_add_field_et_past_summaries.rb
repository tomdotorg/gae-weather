class AddFieldEtPastSummaries < ActiveRecord::Migration
  def self.up
    add_column :past_summaries, :et, :float
  end

  def self.down
    remove_column :past_summaries, :et, :float
  end
end
