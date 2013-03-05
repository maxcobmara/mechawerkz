class ChangeColumnToAssetDisposal2 < ActiveRecord::Migration
  def self.up
  	remove_column :asset_disposals, :checked_by
    remove_column :asset_disposals, :verified_by
    add_column :asset_disposals, :checked_by, :integer
    add_column :asset_disposals, :verified_by, :integer
    add_column :asset_disposals, :examiner1, :integer
    add_column :asset_disposals, :examiner2, :integer
  end

  def self.down
  	remove_column :asset_disposals, :checked_by
    remove_column :asset_disposals, :verified_by
    remove_column :asset_disposals, :examiner1
    remove_column :asset_disposals, :examiner2
    add_column :asset_disposals, :checked_by, :string
  	add_column :asset_disposals, :verified_by, :string
  end
end
