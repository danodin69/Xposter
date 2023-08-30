class SessionsController < ApplicationController
    def new
        
    end

    def create
       user = User.find_by(email: params[:email])

       if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Login Attained"
       else
        flash[:alert] = "Something is wrong with your credentials"
        render :new , status: 422
       end

    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logout Attained"
    end

end