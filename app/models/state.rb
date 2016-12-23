class State
  include Mongoid::Document
  validates_uniqueness_of :name


  has_many :cities

  field :name, type: String
end
