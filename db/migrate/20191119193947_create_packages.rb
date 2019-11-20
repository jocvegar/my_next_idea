class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.datetime :start_date
      t.datetime :finish_date
      t.string   :title
      t.boolean  :terminado, default: false

      t.timestamps
    end
  end
end
