class ChangeColumnToAssetDisposal5 < ActiveRecord::Migration
  def self.up
  	add_column :asset_disposals, :is_staff1, :integer
    add_column :asset_disposals, :is_staff2, :integer
    add_column :asset_disposals, :examiner_staff1, :string
    add_column :asset_disposals, :examiner_staff2, :string
  end

  def self.down
  	remove_column :asset_disposals, :examiner1
    remove_column :asset_disposals, :examiner2
	remove_column :asset_disposals, :examiner_staff1
    remove_column :asset_disposals, :examiner_staff2
  end
end
