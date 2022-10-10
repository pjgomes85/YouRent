class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
