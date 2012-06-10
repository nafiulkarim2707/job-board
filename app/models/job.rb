class Job
  TYPES = [:full_time, :part_time, :telecommute, :other]

  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MultiParameterAttributes

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
  field :vacancies, type: Integer

  validates :title, :presence => true
  validates :description, :presence => true
  validates :requirements, :presence => true
  validates :expires_at, :presence => true

  scope :active, where(display: true).where(:expires_at.gte => Time.now)

  belongs_to :company
  has_many :candidacies

  def is_active?
    self.expires_at > Time.now
  end

  def has_active_candidacy?(candidate_id)
    !!Candidacy.where(:candidate_id => candidate_id, :job_id => self.id).first
  end
end
