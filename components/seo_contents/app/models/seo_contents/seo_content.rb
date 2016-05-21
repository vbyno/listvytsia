module SeoContents
  class SeoContent
    include Mongoid::Document

    field :title
    field :description
    field :keywords, default: ''

    validates :title, :description, presence: true
    validates :title, length: { in: 1..70 } #{ in: 20..70 }
    validates :description, length: {in: 1..160} #{ in: 50..160 }

    def self.human_list_name
      model_name.human(count: Float::INFINITY)
    end
  end
end
