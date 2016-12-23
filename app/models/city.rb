class City
  include Mongoid::Document
  has_many :addresses
  belongs_to :state
  validates_uniqueness_of :name


  field :name, type: String

end
