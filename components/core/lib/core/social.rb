# frozen_string_literal: true

require_relative 'social/base_adapter'
require_relative 'social/facebook_adapter'
require_relative 'social/google_adapter'

module Core::Social
  ADAPTERS = {
    'facebook' => Core::Social::FacebookAdapter,
    'google_oauth2' => Core::Social::GoogleAdapter
  }.freeze

  def self.build_adapter(response)
    ADAPTERS.fetch(response.provider).new(response)
  end
end
