require 'rails/generators'
require 'rails/generators/active_record'
require 'rails/generators/actions/create_migration'

class DataMigrationGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../../templates', __FILE__)
  include Rails::Generators::Migration

  def create_data_migration
    migration_template('data_migration_template.rb', "db/migrate_data/#{file_name}.rb")
  end

  private

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end

  def migration_class_name
    @name.classify
  end
end
