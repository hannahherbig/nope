Sequel::Model.raise_on_save_failure = true
Sequel::Model.plugin :timestamps

DB = Sequel.sqlite(File.expand_path('../db/app.db', File.dirname(__FILE__)))
DB.loggers << logger
