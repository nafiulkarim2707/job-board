class Skill
  include Mongoid::Document

  field :type, type: String
  field :description, type: String

  validates :type, :presence => true
  validates :description, :presence => true

  embedded_in :resume
end
