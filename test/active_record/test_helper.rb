require 'test_helper'
require 'active_record'

def open_test_db_connect
  ActiveRecord::Base.establish_connection(
    :adapter => 'sqlite3',
    :database => 'test/test.sqlite3'
  )
end
open_test_db_connect

def close_test_db_connect
  ActiveRecord::Base.connection.disconnect!
end

class Test::Unit::TestCase
  def no_connection
    close_test_db_connect
    assert_nothing_raised { yield }
  ensure
    open_test_db_connect
  end
end

require 'active_record/model/user'
require 'active_record/model/book'
