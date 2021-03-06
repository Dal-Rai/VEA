class Profile < ApplicationRecord
  validates_presence_of :firstname, :middlename, :lastname

  has_attached_file :avatar,
                    {
                        url: "/uploads/attachments/:basename.:extension",
                        path: ":rails_root/public/uploads/attachments/:basename.:extension"
                    }

  validates_attachment_size :avatar, less_than: 5.megabytes
  validates_attachment :avatar,
                       :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg", "image/tiff", "image/bmp"] }

  enum gender: { Male: 4241, Female: 4242, Unknown: 0 }
  belongs_to :user, inverse_of: :profile
end
