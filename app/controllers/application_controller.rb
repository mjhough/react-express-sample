class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def execute_sql(sql)
    ActiveRecord::Base.connection.exec_query(sql)
  end
end
