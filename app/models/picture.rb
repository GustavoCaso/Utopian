class Picture < ActiveRecord::Base

  belongs_to :post

  has_attached_file :photo, :styles => { }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
end
