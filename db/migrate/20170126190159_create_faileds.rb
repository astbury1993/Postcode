class CreateFaileds < ActiveRecord::Migration
  def change
    create_table :faileds do |t|
      t.integer :row_id
      t.string :text

      t.timestamps null: false
    end
  end
end
