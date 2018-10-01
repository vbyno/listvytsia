# frozen_string_literal: true

module Core::Social
  class BaseAdapter
    PROVIDERS = {
      'facebook' => 'facebook',
      'google_oauth2' => 'google'
    }.freeze

    attr_reader :response

    def initialize(response)
      @response = response
    end

    def provider
      PROVIDERS.fetch(response.provider)
    end

    def uid
      response.uid
    end

    def password
      Devise.friendly_token[0,20]
    end

    %i[
      first_name
      last_name
      email
      photo_url
    ].each do |name|
      define_method(name) { raise NotImplementedError }
    end
  end
end
