class Job
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  belongs_to :company

  field :title, type: String
  field :location, type: String
  field :description, type: String
  field :requirements, type: String
  field :additional_qualities, type: String
  field :salary, type: String
  field :instructions, type: String
  field :contract_type, type: String
  field :notes, type: String
  field :expires_at, type: Time
  field :display, type: Boolean, default: true
  field :tags, type: String

  validates :title, :presence => true
  validates :description, :presence => true
  validates :requirements, :presence => true
  validates :expires_at, :presence => true

  scope :active, where(display: true).where(:expires_at.gte => Time.now)
end
