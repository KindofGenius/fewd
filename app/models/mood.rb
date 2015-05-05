class Mood < ActiveRecord::Base

  has_many :dish_moods
  has_many :dishes, through: :dish_moods

  has_attached_file :icon, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/

  has_attached_file :background, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/
end
