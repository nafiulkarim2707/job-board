class Company
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :name, type: String
  field :email, type: String
  field :website, type: String
  field :address, type: String
  field :overview, type: String
  field :linkedin_key, type: String

  validates :name, :presence => true, :uniqueness => true
  validates :website, :uniqueness => true

  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  has_many :jobs, :dependent => :delete
  belongs_to :employer, :class_name => 'User'
  has_many :positions

end
