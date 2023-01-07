require "rails/generators"

module Tails
  class DatabaseGenerator < Rails::Generators::NamedBase

    desc "Generates a new database configuration file"
    def create_database_config_file
      create_file "config/databases/tails_#{name}.yml", options_to_yaml
    end

    private

    def options_to_yaml
      { "tails_#{file_name}" => options[:config] }.to_yaml
    end
  end
end