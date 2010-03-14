class AddMissingColumnsToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :realty_type, :string
    add_column :entries, :currency, :string
    add_column :entries, :highway_id, :integer
    add_column :entries, :plot_area, :integer
    add_column :entries, :commission_client, :decimal
    add_column :entries, :commission_agent, :decimal
    add_column :entries, :phone, :boolean
    add_column :entries, :refridgerator, :boolean
    add_column :entries, :tv, :boolean
    add_column :entries, :washing_machine, :boolean
  end

  def self.down
    add_column :entries, :realty_type, :string
    add_column :entries, :currency, :string
    add_column :entries, :highway_id, :integer
    add_column :entries, :plot_area, :integer
    add_column :entries, :commission_client, :decimal
    add_column :entries, :commission_agent, :decimal
    add_column :entries, :phone, :boolean
    add_column :entries, :refridgerator, :boolean
    add_column :entries, :tv, :boolean
    add_column :entries, :washing_machine, :boolean
  end
end
