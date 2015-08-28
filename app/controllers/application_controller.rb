class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # before_action :require_login

  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # def require_login

  #   <% if current_user %>
  #     Welcome, <%= current_user.name %>!
  #     <li><a href="/signout">Sign Out</a></li>
  #     <% else %>
  #     <li><%= link_to "Sign in with Facebook", "/auth/facebook" %></li>
  #     <% end %>

  # end

end
