require 'sqlite3'

module PassiveRecord
  class Connection
    def initialize(name = 'main.db')
      @database = SQLite3::Database..new(name, results_as_hash: true)
    end
  end
end
