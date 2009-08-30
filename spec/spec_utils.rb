# Creating a class that extends this instead of extending active record
# will allow you to make an AR class without an actual table behind it.
class MockActiveRecord < ActiveRecord::Base; end
MockActiveRecord.class_eval do
  alias_method :save, :valid?
  def self.columns() @columns ||= []; end
  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type, null)
  end
end
