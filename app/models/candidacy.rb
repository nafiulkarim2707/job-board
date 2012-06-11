class Candidacy
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :status, type: String
  belongs_to :candidate, :class_name => 'User'
  belongs_to :job

end
