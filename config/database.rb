Sequel::Model.raise_on_save_failure = true

DB = Sequel.sqlite(File.expand_path('../db/app.db', File.dirname(__FILE__)))
DB.loggers << logger # add padrino logger
