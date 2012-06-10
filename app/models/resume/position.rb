class Position
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :title, type: String
  field :description, type: String
  field :started_at, type: Date
  field :ended_at, type: Date
  field :is_current, type: Boolean

  field :company_id, type: String
  field :company_name, type: String
  field :company_location, type: String

  validates :title, :presence => true
  validates :started_at, :presence => true
  validates :ended_at, :presence => true, :if => Proc.new{ |p| p[:is_current].blank? }
  validates :is_current, :presence => true, :if => Proc.new{ |p| p[:ended_at].blank? }

  embedded_in :resume
end
