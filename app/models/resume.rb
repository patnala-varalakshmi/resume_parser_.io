require 'docx'

class Resume < ApplicationRecord

  VALID_PHONE_NUMBER_REGEX = (/(^| )(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}( |$)/)
  VALID_EMAIL_REGEX = (/\w+@[\w.-]+|\{(?:\w+, *)+\w+\}@[\w.-]+/)

  has_one :user, dependent: :destroy
  has_one_attached :file
  validates :file, presence: true

  after_create :parse_resume

  def file_path
    ActiveStorage::Blob.service.path_for(file.key)
  end

  def parse_resume
    doc = Docx::Document.open(file_path)
    @name = File.basename(file_name.to_s, ".*").split('_')[0]
    doc.paragraphs.each do |p|
      @email =  p.to_s.match(VALID_EMAIL_REGEX) if p.to_s.match(VALID_EMAIL_REGEX)
      @phone_number =  p.to_s.match(VALID_PHONE_NUMBER_REGEX) if p.to_s.match(VALID_PHONE_NUMBER_REGEX)
    end
    User.create!(name: @name, email: @email, phone_number: @phone_number, resume_id: id)
  end

  def file_name
    file.blob.filename
  end
end
