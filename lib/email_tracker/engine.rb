module EmailTracker
  class Engine < ::Rails::Engine
    isolate_namespace EmailTracker

    config.active_record.schema_format = :sql
    config.api_only = true

    def self.setup(&block)
      yield self.config
    end
  end
end
