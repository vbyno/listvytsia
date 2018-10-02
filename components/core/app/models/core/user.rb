module Core
  class User
    include Mongoid::Document
    include Core::ModelMethods

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable,
           :registerable,
           :recoverable,
           :rememberable,
           :trackable,
           :validatable,
           :confirmable,
           :omniauthable,
           omniauth_providers: %i[facebook google_oauth2]

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

    # Confirmable
    field :confirmation_token,   type: String
    field :confirmed_at,         type: Time
    field :confirmation_sent_at, type: Time
    field :unconfirmed_email,    type: String # Only if using reconfirmable

    ## Lockable
    # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
    # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
    # field :locked_at,       type: Time

    embeds_one :profile, class_name: 'Core::Profile'
    embeds_many :social_providers, class_name: 'Core::SocialProvider'

    has_and_belongs_to_many :roles, class_name: 'Core::Role', autosave: true

    scope :by_email, ->(email) { where(email: email) }

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] &&
           session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end

    def name; end
  end
end
