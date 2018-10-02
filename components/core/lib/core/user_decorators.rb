require_relative 'user_decorators/visitor'
require_relative 'user_decorators/user'

module Core
  module UserDecorators
    def self.build(user)
      user ? User.new(user) : Visitor.instance
    end
  end
end
