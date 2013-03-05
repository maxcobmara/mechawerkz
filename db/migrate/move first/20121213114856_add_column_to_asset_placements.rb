class AddColumnToAssetPlacements < ActiveRecord::Migration
  def self.up
    add_column :asset_placements, :quantity, :integer
  end

  def self.down
    remove_column :asset_placements, :is_maintainable
  end
end
