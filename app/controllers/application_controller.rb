class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  @gb = Gibbon::API.new("2a6262f26c44f974bbc48801f00ca358-us8") #now expired
end
