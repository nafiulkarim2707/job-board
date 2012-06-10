class Candidacy
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  belongs_to :candidate, :class_name => 'User'
  belongs_to :job

end
