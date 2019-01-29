# frozen_string_literal: true

module Databases
  class ConnectionService
    attr_reader :database, :company_name

    def initialize(company)
      @company_name = company.name
      @database = company.database
    end

    def call
      setup_database_connection unless shard_setup?
    end

    private

    def shard_setup?
      environment_config = Octopus.config[Rails.env.to_sym]
      environment_config.present? && environment_config.key?(company_name)
    end

    def setup_database_connection
      Octopus.setup do |config|
        config.environments = [Rails.env.to_sym]

        config.shards = {
          company_name.downcase.to_sym => company_database_configs
        }
      end
    rescue StandardError => exception
      exception.message
    end

    def company_database_configs
      {
        adapter: 'postgresql',
        database: database.name,
        username: database.username,
        password: database.password,
        host: database.host,
        encoding: 'unicode'
      }
    end
  end
end
