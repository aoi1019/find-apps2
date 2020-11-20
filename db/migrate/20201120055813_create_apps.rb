class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :language, null: false 
      t.text :point
      t.string :reference
      t.integer :period
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end