class Customer
  include Mongoid::Document
  has_many :addresses

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  validates_format_of :email, with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/


end
