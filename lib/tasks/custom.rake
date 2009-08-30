namespace :db do
  desc "Drop, create, migrate then seed the database"
  task :seed do
    load_db_data("development")
    Rake::Task['db:drop'].invoke
    Rake::Task['db:create'].invoke
    exec "mysql -u #{@user} #{@passwd} #{@db} < db/sql/schema.sql"
  end
end

# Utility Methods

def load_db_data(environment = "development")
  file = YAML.load_file(RAILS_ROOT + "/config/database.yml")
  settings = file[environment]
  @user =   settings["username"]
  @db =     settings["database"]
  @passwd = (settings["password"]) ? "-p#{settings["password"]}" : ""
end