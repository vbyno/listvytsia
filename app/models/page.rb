class Page < Base
  include Mongoid::Document
  include Mongoid::Timestamps

  include Permalinkable

  field :title
  field :content
  field :published, type: Mongoid::Boolean, default: false

  embeds_one :seo_content
  accepts_nested_attributes_for :seo_content, reject_if: :all_blank

  scope :published, -> { where(published: true) }

  validates :title, :seo_content, presence: true
  validates :seo_content, presence: true, if: :published?
end
