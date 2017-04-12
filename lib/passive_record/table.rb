module PassiveRecord
  class Table
    class << self
      def where(**params)
        table_name = self.name.downcase + ?s
        where_clause = params.map {|pair| "#{pair.first} = #{pair.last.is_a?(String) ? "'#{pair.last}'" : pair.last}" }.join(' AND ')
        query = "SELECT * FROM #{table_name} WHERE #{where_clause};"
        @result = Connection.new.exec_query(query) do |row|
          instance = self.new
          row.map {|column, value| instance.send("#{column}=", value) }

          instance
        end
      end

      def size
        @result.size
      end
    end
  end
end
