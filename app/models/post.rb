class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :users

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true

  #image upload paperclip
  has_attached_file :image, :default_url => ":style/rails1.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ ##validation of image upload only

  ##search method
  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
