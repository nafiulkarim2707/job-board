class Company
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :website, type: String
  field :address, type: String
  field :overview, type: String
  field :linkedin_key, type: String

  has_many :jobs, :dependent => :delete
  belongs_to :user


  validates :name, :presence => true, :uniqueness => true
  validates :website, :uniqueness => true

  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

end
