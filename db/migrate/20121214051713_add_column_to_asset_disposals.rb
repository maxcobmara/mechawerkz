class AddColumnToAssetDisposals < ActiveRecord::Migration
def self.up
    add_column :asset_disposals, :witness_outsider1, :string
    add_column :asset_disposals, :witness_outsider2, :string
    add_column :asset_disposals, :witness_is_staff1, :boolean
    add_column :asset_disposals, :witness_is_staff2, :boolean
  end

  def self.down
   	remove_column :asset_disposals, :witness_outsider1
    remove_column :asset_disposals, :witness_outsider2
	remove_column :asset_disposals, :witness_is_staff1
    remove_column :asset_disposals, :witness_is_staff2
  end
end
