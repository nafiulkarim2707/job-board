class Education
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes


  field :school, type: String
  field :degree, type: String
  field :field_of_study, type: String
  field :started_at, type: Date
  field :ended_at, type: Date

  validates :school, :presence => true
  validates :degree, :presence => true
  validates :field_of_study, :presence => true
  validates :started_at, :presence => true
  validates :ended_at, :presence => true

  embedded_in :resume



end
