module SeoContents
  class SeoContent
    include Mongoid::Document

    embedded_in :page

    field :title
    field :description
    field :keywords, default: ''
    field :target_id

    validates :title, :description, :target_id, presence: true
    validates :title, length: { in: 1..70 } #{ in: 20..70 }
    validates :description, length: {in: 1..160} #{ in: 50..160 }

    def self.for_target(target_id)
      where(target_id: target_id).first || new(target_id: target_id)
    end
  end
end
