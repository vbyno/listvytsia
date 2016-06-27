module Core
  class User
    include Mongoid::Document
    include Core::ModelMethods

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

    ## Database authenticatable
    field :email,              default: ""
    field :encrypted_password, default: ""

    ## Recoverable
    field :reset_password_token
    field :reset_password_sent_at, type: Time

    ## Rememberable
    field :remember_created_at, type: Time

    ## Trackable
    field :sign_in_count,      type: Integer, default: 0
    field :current_sign_in_at, type: Time
    field :last_sign_in_at,    type: Time
    field :current_sign_in_ip
    field :last_sign_in_ip

    ## Confirmable
    # field :confirmation_token,   type: String
    # field :confirmed_at,         type: Time
    # field :confirmation_sent_at, type: Time
    # field :unconfirmed_email,    type: String # Only if using reconfirmable

    ## Lockable
    # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
    # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
    # field :locked_at,       type: Time

    has_and_belongs_to_many :roles, class_name: 'Core::Role', autosave: true

    def name; end

    def permitted_to?(action, resource)
      permission_identifiers.any? do |p|
        p.action.to_sym == action &&
        p.resource.to_sym == resource
      end
    end

    def moderator?
      permitted_to?(:moderate, :articles)
    end

    def author_of?(article)
      article.author?(self)
    end

    private

    def permission_identifiers
      @permission_identifiers ||= roles.map(&:permissions).flatten
    end
  end
end
