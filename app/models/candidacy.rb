class Candidacy
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes


  field :linkedin_link, type: String
end
