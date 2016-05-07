module AppComponent
  class MissedUser
    include Singleton

    delegate :bson_type, :to_bson, to: :_id

    def _id
      nil
    end

    def permitted_to?(*)
      false
    end

    def moderator?
      false
    end

    def author_of?(*)
      false
    end
  end
end
