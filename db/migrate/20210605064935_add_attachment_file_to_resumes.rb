class AddAttachmentFileToResumes < ActiveRecord::Migration[5.2]
  def self.up
    change_table :resumes do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :resumes, :file
  end
end
