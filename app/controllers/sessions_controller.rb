class SessionsController < ApplicationController
    def new
    end
    def create
        @user = User.find_by(name:session_params[:name])
        if @user.authenticate(session_params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end
    
    private
    def session_params
        params.require(:user).permit(:name,:password)
    end
end