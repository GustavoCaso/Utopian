class Post < ActiveRecord::Base
  has_many :pictures

  validates_presence_of :date, :location, :short_description, :description, :category
  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: proc {|attributes| attributes['photo'].blank?}

  CATEGORIES = ["People Say", "Utopia"]
  MAX_PHOTOS = 7
end
