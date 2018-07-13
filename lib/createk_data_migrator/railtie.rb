class CreatekDataMigrator
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/data_migrate.rake'
    end
  end
end
