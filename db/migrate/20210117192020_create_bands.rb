class CreateBands < ActiveRecord::Migration[6.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.belongs_to :manager, null: false, foreign_key: true

      t.timestamps
    end
  end
end
