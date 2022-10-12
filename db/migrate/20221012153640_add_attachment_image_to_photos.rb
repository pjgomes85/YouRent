class AddAttachmentImageToPhotos < ActiveRecord::Migration[7.0]
  def up
    change_table :photos do |t|
      t.attachment :image
    end
  end

  def down
    remove_attachment :photos, :image
  end
end
