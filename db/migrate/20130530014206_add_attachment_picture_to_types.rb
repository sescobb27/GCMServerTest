class AddAttachmentPictureToTypes < ActiveRecord::Migration
  def self.up
    change_table :types do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :types, :picture
  end
end
