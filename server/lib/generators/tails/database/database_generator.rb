require "rails/generators"
require "rails/generators/app_base"

module Tails
  class DatabaseGenerator < Rails::Generators::NamedBase
    include Rails::Generators::Database

    def database_gemfile_entry
      gsub_file "Gemfile", database_gem_indicator, replacement
    end

    private

    def gsub_file file, match, replacement
      path = Rails.root.join(file)
      content = File.read(path).gsub(match, replacement)
      File.open(path, 'wb') { |file| file.write(content) }
    end

    def replacement
    database_gem_indicator + "\n" + gemfile_entry.to_s
    end

    def database_gem_indicator
      "# Database gems"
    end

    def gemfile_entry
      gem_name, gem_version = gem_for_database(name)
      Rails::Generators::AppBase::GemfileEntry.version gem_name, gem_version, "Setup #{name} as available database for Tails"
    end
  end
end