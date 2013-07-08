class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    def auth_user
      user_id = params[:user_id]
      if user_id
        render text: 'No user with this id' unless User.exists? user_id
      end
    end
end
