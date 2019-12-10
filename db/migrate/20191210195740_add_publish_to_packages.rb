class AddPublishToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :publish, :boolean, default: false
  end
end
