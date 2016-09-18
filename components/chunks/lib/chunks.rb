require 'mongoid'
require 'mongoid_rails_migrations'
require 'core'

module Chunks
  require_relative 'chunks/engine'
  require_relative 'chunks/chunk_policy'
end
