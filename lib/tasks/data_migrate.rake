require 'data_migrator'

namespace :db do
  desc 'Run Data Migrations'
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
