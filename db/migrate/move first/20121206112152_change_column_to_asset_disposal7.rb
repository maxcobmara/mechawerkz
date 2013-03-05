class ChangeColumnToAssetDisposal7 < ActiveRecord::Migration
  def self.up
  	remove_column :asset_disposals, :examiner_staff1
    remove_column :asset_disposals, :examiner_staff2
  	add_column :asset_disposals, :examiner_staff1, :integer
    add_column :asset_disposals, :examiner_staff2, :integer
  end

  def self.down
   	remove_column :asset_disposals, :examiner_staff1
    remove_column :asset_disposals, :examiner_staff2
    add_column :asset_disposals, :examiner_staff1, :string
    add_column :asset_disposals, :examiner_staff2, :string
  end
end
