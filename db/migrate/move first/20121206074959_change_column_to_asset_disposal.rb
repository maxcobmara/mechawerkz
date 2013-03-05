class ChangeColumnToAssetDisposal < ActiveRecord::Migration
  def self.up
  	remove_column :asset_disposals, :checked_by
    remove_column :asset_disposals, :verified_by
    add_column :asset_disposals, :checked_by, :string
  	add_column :asset_disposals, :verified_by, :string
  end

  def self.down
  	add_column :asset_disposals, :checked_by, :integer
    add_column :asset_disposals, :verified_by, :integer
    remove_column :asset_disposals, :checked_by
    remove_column :asset_disposals, :verified_by
  end
end
