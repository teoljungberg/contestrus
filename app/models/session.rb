class Session
  attr_reader :session

  def initialize(session)
    @session = session
  end

  def user
    return @user if defined?(@user)

    if session[:user_id] && session[:session_hash]
      user = User.find(session[:user_id])
      if user.session_hash == session[:session_hash]
        @user = user
      end
    end
  end

  def user=(user)
    if @user = user
      session[:user_id] = user.id
      session[:session_hash] = user.session_hash
    else
      session.delete(:user_id)
      session.delete(:session_hash)
    end
  end
end
