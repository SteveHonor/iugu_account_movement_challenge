require 'active_record'
require 'yaml'

task default: :migrate

desc "Migrate the database"
  namespace :db do
  task migrate: :environment do
    ActiveRecord::MigrationContext.new("db/migrate", ActiveRecord::SchemaMigration).migrate(nil)
  end

  task :environment do
    ActiveRecord::Base.establish_connection(
      YAML::load(
        File.open('config/database.yml')
      )
    )
  end
end
