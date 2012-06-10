class Resume
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

  field :firstname, type: String
  field :lastname, type: String
  field :email, type: String
  field :language, type: String
  field :skills, type: String

  validates :firstname, :presence => true
  validates :lastname, :presence => true
  validates :email, :presence => true, :uniqueness => true

  belongs_to :candidate, :class_name => 'User'
  embeds_many :positions
  embeds_many :educations

  accepts_nested_attributes_for :positions, :allow_destroy => true, :reject_if => proc {|p| p[:title].blank?}
  accepts_nested_attributes_for :educations, :allow_destroy => true, :reject_if => proc {|p| p[:school].blank?}

  has_many :candidacies
end
