require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'app/models/teacher'

desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::MigrationContext.new(ActiveRecord::Migrator.migrations_paths).migrate do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the students database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc "populate the teachers database with sample data"
task "db:populate_teacher" do
  Teacher.create(first_name: 'John', last_name: 'Lee', email: 'john.lee@example.com', phone: '00 000 000 000')
  Teacher.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', phone: '00 111 000 000')
  Teacher.create(first_name: 'Jane', last_name: 'Doe', email: 'jane.doe@example.com', phone: '00 000 111 000')
  Teacher.create(first_name: 'Angie', last_name: 'JoLee', email: 'angie.jolee@example.com', phone: '00 000 000 111')
  Teacher.create(first_name: 'Scarly', last_name: 'Johansburg', email: 'scarly.johansburg@example.com', phone: '00 222 000 000')
  Teacher.create(first_name: 'Christopher', last_name: 'Heavens', email: 'chris.heavens@example.com', phone: '00 000 222 000')
  Teacher.create(first_name: 'Makan', last_name: 'Kangkung', email: 'kangkung.lover@example.com', phone: '00 000 000 222')
  Teacher.create(first_name: 'Tony', last_name: 'Chopper', email: 'chop.chop@example.com', phone: '00 333 000 000')
  Teacher.create(first_name: 'Father', last_name: 'Darth', email: 'darth.vader@example.com', phone: '00 000 333 000')
  Teacher.create(first_name: 'Effin', last_name: 'Logee', email: 'effin.logy@example.com', phone: '00 000 000 333')
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
