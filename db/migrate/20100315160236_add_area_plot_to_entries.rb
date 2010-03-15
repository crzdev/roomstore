class AddAreaPlotToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :area_plot, :integer
  end

  def self.down
    remove_column :entries, :area_plot
  end
end
