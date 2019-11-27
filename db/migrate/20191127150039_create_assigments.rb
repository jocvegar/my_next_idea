class CreateAssigments < ActiveRecord::Migration[6.0]
  def change
    create_table :assigments do |t|
      t.references :team, null: false, foreign_key: true
      t.references :package, null: false, foreign_key: true
      t.integer :position
      t.boolean :started, default: false
      t.boolean :finished, default: false

      t.timestamps
    end
  end
end
