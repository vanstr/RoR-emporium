class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  belongs_to :publisher

  has_many :cart_items
  has_many :carts, :through => :cart_items

  file_column :cover_image
  validates_length_of :title, :in => 1..255
  validates :publisher, :presence => true
  validates :authors, :presence => true
  validates :published_at, :presence => true
  validates_numericality_of :page_count, :only_integer => true
  validates_numericality_of :price
  validates_format_of :isbn, :with => /[0-9\-xX]{13}/
  validates_uniqueness_of :isbn
# roughly speaking sets list of model protected attributes to []
# making all attributes accessible while mass-assignment
  attr_protected

  def self.latest
    find :all, :limit => 10, :order => "books.id desc", :include => [:authors, :publisher]
  end

end