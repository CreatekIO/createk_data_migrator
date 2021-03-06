require "createk_data_migrator/version"
require "createk_data_migrator/railtie" if defined?(Rails)

class CreatekDataMigrator
  class << self
    attr_writer :data_migrations_path

    def migrate
      begin
        old_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths
        ActiveRecord::Tasks::DatabaseTasks.migrations_paths = [Rails.root.join('db/migrate_data')]

        ActiveRecord::Tasks::DatabaseTasks.migrate
      ensure
        ActiveRecord::Tasks::DatabaseTasks.migrations_paths = old_paths
      end
    end
  end
end
