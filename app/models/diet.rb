class Diet < ActiveRecord::Base
  has_many :diet_dishes
  has_many :dishes, through: :diet_dishes

  has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  has_attached_file :background, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
