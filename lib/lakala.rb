# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__) unless $LOAD_PATH.include?(__dir__)

require 'base64'
require 'openssl'
require 'uri'
require 'net/http'
require 'json'

require 'lakala/configuration'
require 'lakala/client'
require 'lakala/sign'
require 'lakala/utils'
require 'lakala/response'
require 'lakala/header_generator'
require 'lakala/cypher/client'

module Lakala
  GATEWAY_URL = 'https://s2.lakala.com'
  SANDBOX_GATEWAY_URL = 'https://test.wsmsd.cn/sit'

  attr_accessor :configuration

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def gateway_url
      return SANDBOX_GATEWAY_URL if Lakala.configuration.sandbox_mode

      GATEWAY_URL
    end
  end
end
