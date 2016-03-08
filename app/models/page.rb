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
  scope :sorted_by_date, -> { order_by(created_at: :desc) }
  scope :latest, ->(count) { published.sorted_by_date.limit(count) }

  validates :title, :seo_content, presence: true
  validates :seo_content, presence: true, if: :published?
end
