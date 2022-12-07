require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users

    def self.find_by_id(id)
        row = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless row.length > 0
        User.new(id)
    end

    def initialize
        
    end
end

class Questions

end

class Question_follows

end

class Replies

end

class Question_likes

end
