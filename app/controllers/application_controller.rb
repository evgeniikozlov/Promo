class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user_session, :current_user, :username

  def puts_marked(input)
    puts 1111111111
    puts input
    puts 1111111111
  end

  private

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def username(id)
      user = User.find(id)
      if user
        user.name
      else
        "none"
      end
    end
end
