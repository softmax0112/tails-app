module Rails
   class Application
    class Configuration
      def database_configuration
        config = {}
        Dir["config/databases/*.yml"].each do |file|
          config.update database_configuration_from_file(file)
        end
        raise "Could not load database configuration. config/databases is empty" if config.empty?
        config
      end

      def database_configuration_from_file path
        yaml = Pathname.new(path)

        config = if yaml&.exist?
          loaded_yaml = ActiveSupport::ConfigurationFile.parse(yaml)
          if (shared = loaded_yaml.delete("shared"))
            loaded_yaml.each do |env, config|
              if config.is_a?(Hash) && config.values.all?(Hash)
                config.map do |name, sub_config|
                  sub_config.reverse_merge!(shared)
                end
              else
                config.reverse_merge!(shared)
              end
            end
          end
          Hash.new(shared).merge(loaded_yaml)
        elsif ENV["DATABASE_URL"]
          raise "Could not load database configuration. DATABASE_URL environment variable is not currently sopported."
        else
          raise "Could not load database configuration. No such file - #{paths["config/database"].instance_variable_get(:@paths)}"
        end

        config
      rescue => e
        raise e, "Cannot load database configuration:\n#{e.message}", e.backtrace
      end
    end
   end
end