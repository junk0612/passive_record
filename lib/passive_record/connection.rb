require 'sqlite3'

module PassiveRecord
  class Connection
    def initialize(name = 'main.db')
      @database = SQLite3::Database.new(name, results_as_hash: true)
    end

    def exec_query(query)
      statement = @database.prepare(query)
      result = SQLite3::ResultSet.new(@database, statement)
      result.map {|row| yield(row) if block_given? }
    end
  end
end
