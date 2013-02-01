class ChangeColumnToAssetDisposal3 < ActiveRecord::Migration
  def self.up
    remove_column :asset_disposals, :examiner1
    remove_column :asset_disposals, :examiner2
    add_column :asset_disposals, :examiner1, :string
    add_column :asset_disposals, :examiner2, :string
  end

  def self.down
  	remove_column :asset_disposals, :examiner1
    remove_column :asset_disposals, :examiner2
	add_column :asset_disposals, :examiner1, :integer
    add_column :asset_disposals, :examiner2, :integer
  end
end