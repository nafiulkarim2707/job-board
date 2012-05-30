class Job
  include Mongoid::Document
  belongs_to :company

  field :title, type: String
  field :location, type: String
  field :description, type: String
  field :requirements, type: String
  field :additional_qualities, type: String
  field :salary, type: String
  field :instructions, type: String
  field :jobs_term, type: String
  field :notes, type: String
  field :expires_at, type: Time
end
