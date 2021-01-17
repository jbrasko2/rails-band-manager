class CreateBandMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :band_members do |t|
      t.belongs_to :band, null: false, foreign_key: true
      t.belongs_to :member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
