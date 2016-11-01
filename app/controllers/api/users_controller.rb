class Api::UsersController < ApplicationController

    def check_login
        @username=params[:user][:username]
        @password=params[:user][:password]
        @users = User.all

        @users.each do |user|
            if (user[:username] == @username) && (user[:password] == @password)
                session[:current_user_id] = user[:id]
                render status: 200, json: {
                    login: true
                }.to_json
                return
            end
        end

        render status: 200, json: {
            login: false
        }.to_json
    end

    private

        def user_params
            params.require(:user).permit(:username, :password, :email)
        end
end
