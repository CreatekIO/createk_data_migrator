class DataMigrator
  class Railtie < Rails::Railtie
    rake_tasks do
      namespace :db do
        desc 'Migrate data'
        namespace :data do
          task migrate: :environment do
            begin
              old_table_name = ActiveRecord::Base.schema_migrations_table_name
              ActiveRecord::Base.schema_migrations_table_name = 'data_migrations'

              DataMigrator.migrate
            ensure
              ActiveRecord::Base.schema_migrations_table_name = old_table_name
            end
          end
        end
      end
    end
  end
end
