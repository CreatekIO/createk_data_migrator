# CreatekDataMigrator Useage

## Installing CreatekDataMigrator

Add the following to your Gemfile

Add `createk_data_migrator`

Then run `bundle install`

Once CreatekDataMigrator is installed you will need to generate the `data_migrations`
table that stores the versioning of data migrations.

Run the following from the command line. `rails generate data_migrator`

Then run `rake db:migrate`

CreatekDataMigrator should now be installed & ready to be used

## Data Migration

Data migrations are used within an application to make ammendments & changes to data. 
For example if a set collection of `SomeModel`'s need their `status` changing to
`active`.

## Creating the migration itself 

We can create data migrations using a pre-defined Rails generator that is ran
from the command line. `rails generate data_migration change_some_models_state_to_active`.
This will then create a data migration file within the `db/migrate_data` folder.

By default this file will contain an `up` and a `down` method, although a
`rollback` task not yet been implemented for data migrations.

Enter some code that you would like to be run within the `up` method.

```
class ChangeSomeModelsStateToActive < ActiveRecord::Migration
  def up
    some_models = SomeModel.find(some_model_ids)
    some_models.update_all(state: 'active')
  end

  def down
  end
end
```

## Running the migration

Outstanding data migrations can be manually ran with the command `rake db:data:migrate`.

## Ensuring the same data migration is not run more than once

The implementation is inherited from the Rails way of creating the usual database
migrations. This means when a data migration is ran, a record of which migration 
is inserted into the `data_migrations` table. This table is then checked prior
to running any future data migration, thus stopping duplicate entries.
