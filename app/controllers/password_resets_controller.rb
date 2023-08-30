class PasswordResetsController < ApplicationController

    def new
        
    end

    def create

        @user = User.find_by(email: params[:email])

        if @user.present?
            PasswordMailer.with(user: @user).reset.deliver_now
        end
        redirect_to root_path, notice:"Sent Link To Reset Password"

    end

    def edit
        @user = User.find_signed!(params[:token], purpose:"edit_password_reset")

    rescue ActiveSupport::MessageVerifier::InvalidSignature
        redirect_to edit_password_reset_path, alert:"Expired Token, Try Again"
    end

    def update
        @user = User.find_signed!(params[:token], purpose:"edit_password_reset")
        
        if @user.update(password_params)
            redirect_to sign_in_path, notice: "Password reset successful, Login to continue."
        else
            render :edit, status: 422
        end

    end       
    
    private
    def password_params
        params.require(:user).permit(:password, :password_confirmation)
    end

end