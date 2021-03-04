class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true, optional: true

  has_attached_file :file,
                    {
                        url: "/uploads/attachments/:basename.:extension",
                        path: ":rails_root/public/uploads/attachments/:basename.:extension",
                    }

  validates_attachment_size :file, less_than: 5.megabytes
  validates_attachment :file,
                       :content_type => { :content_type => %w(text/csv video/mp4 video/quicktime image/jpeg image/jpg image/png application/pdf application/vnd.ms-excel application/msword application/vnd.openxmlformats-officedocument.spreadsheetml.sheet application/vnd.openxmlformats-officedocument.wordprocessingml.document text/plain application/vnd.openxmlformats-officedocument.presentationml.presentation) }

end
