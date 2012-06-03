class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :content, type: String
  field :display, type: Boolean
  field :_id, type: String, default: -> { title.to_s.parameterize }


  validates :title, :presence => true, :uniqueness => true
  validates :content, :presence => true
end
