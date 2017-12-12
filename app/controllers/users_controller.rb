class UsersController < ApplicationController
    before_action :ensure_signed_out, only: [:new, :create]
    before_action :ensure_signed_in, only: [:show, :index]

    def new
        @user = User.new
    end

    def create 
        @user = User.new(create_params)

        if @user.save
            sign_in(@user)
            flash[:notice] = 'Congrats! You are signed in!'
            redirect_to users_path
        else
            flash[:error] = @user.errors.full_messages.join(', ')
            render :new
        end
    end
    
end
