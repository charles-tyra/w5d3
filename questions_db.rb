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
    attr_accessor :id, :fname, :lname
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
        Users.new(row.first)
    end

    def self.find_by_name(fname, lname)
        row = QuestionsDBConnection.instance.execute(<<-SQL, fname , lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname , lname = ?
        SQL
        return nil unless row.length > 0
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end

class Questions
    attr_accessor :id, :title, :body, :author_id
    def self.find_by_id(id)
        row = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless row.length > 0
        Questions.new(row.first)
    end

    def self.find_by_author_id(author_id)
        row = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        return nil unless row.length > 0
        row.map { |author| Questions.new(author)}
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end
end

class Question_follows
    attr_accessor :users_id, :questions_id
    def initialize(options)
        @users_id = options['users_id']
        @questions_id = options['questions_id']
    end
end

class Replies
    attr_accessor :id, :questions_id, :users_id, :reply_id, :body
    def self.find_by_id(id)
        row = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless row.length > 0
        Replies.new(row.first)
    end

    def self.find_by_user_id(user_id)
        row = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        return nil unless row.length > 0

        row.map { |user| Replies.new(user)}
    end

    def self.find_by_question_id(question_id)
        row = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id
        SQL
        return nil unless row.length > 0

        row.map { |question| Replies.new(question)}
    end

    def initialize(options)
        @id = options['id']
        @questions_id = options['questions_id']
        @users_id = options['users_id']
        @reply_id = options['reply_id']
        @body = options['body']
    end
end

class Question_likes
    attr_accessor :id, :questions_id, :users_id
    def self.find_by_id(id)
        row = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless row.length > 0
        Question_likes.new(row.first)
    end

    def initialize(options)
        @id = options['id']
        @questions_id = options['questions_id']
        @users_id = options['users_id']
    end
end
