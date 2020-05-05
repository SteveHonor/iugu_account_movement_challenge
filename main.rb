require 'active_record'
require_relative 'handler_csv'


ActiveRecord::Base.establish_connection(
  YAML::load(
    File.open('config/database.yml')
  )
)

Dir[File.dirname(__FILE__) + '/models/*.rb'].each do |file|
  require file
end

Account.destroy_all
Transaction.destroy_all

@handler_csv = HandlerCsv.new(ARGV)

@handler_csv.run
@handler_csv.movementation
@handler_csv.print
