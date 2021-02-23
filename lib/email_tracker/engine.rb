module EmailTracker
  class Engine < ::Rails::Engine
    isolate_namespace EmailTracker

    config.active_record.schema_format = :sql
  end
end
