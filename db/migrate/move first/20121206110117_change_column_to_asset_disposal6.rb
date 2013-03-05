class ChangeColumnToAssetDisposal6 < ActiveRecord::Migration
  def self.up
  	remove_column :asset_disposals, :is_staff1
    remove_column :asset_disposals, :is_staff2
  	add_column :asset_disposals, :is_staff1, :boolean
    add_column :asset_disposals, :is_staff2, :boolean
  end

  def self.down
   	remove_column :asset_disposals, :is_staff1
    remove_column :asset_disposals, :is_staff2
    add_column :asset_disposals, :is_staff1, :integer
    add_column :asset_disposals, :is_staff2, :integer
  end
end
