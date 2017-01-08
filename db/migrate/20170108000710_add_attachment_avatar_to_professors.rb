class AddAttachmentAvatarToProfessors < ActiveRecord::Migration
  def self.up
    change_table :professors do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :professors, :avatar
  end
end
