# frozen_string_literal: true

require "fileutils"
require "pathname"
require "digest/md5"
require "active_support/core_ext/numeric/bytes"

module ActiveStorage
  # Wraps a local disk path as an Active Storage service. See ActiveStorage::Service for the generic API
  # documentation that applies to all services.
  class Service::RedisService < Service
    attr_reader :root

    def initialize(_params)
      @conn = Redis.new
    end

    def upload(key, io, checksum: nil)
      instrument :upload, key: key, checksum: checksum do
        @conn.set(key, io.read)
      end
    end

    def download(key)
      if block_given?
        instrument :streaming_download, key: key do
          yield @conn.get(key)
        end
      else
        instrument :download, key: key do
          @conn.get(key)
        end
      end
    end

    def delete(key)
      instrument :delete, key: key do
        @conn.del(key)
      end
    end

    def exist?(key)
      instrument :exist, key: key do |payload|
        payload[:exist] = @conn.exists(key)
      end
    end

    def url(key, expires_in:, filename:, disposition:, content_type:)
      instrument :url, key: key do |payload|
        payload[:url] = url_helpers.redis_storage_url(
          key,
          host: current_host
        )
      end
    end

    private
      def url_helpers
        @url_helpers ||= Rails.application.routes.url_helpers
      end

      def current_host
        ActiveStorage::Current.host
      end
  end
end
