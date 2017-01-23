class CreateImports < ActiveRecord::Migration
  def change
    create_table :imports do |t|
      t.integer :row_id
      t.string :text

      t.timestamps null: false
    end
  end
end
