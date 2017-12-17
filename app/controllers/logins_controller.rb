class LoginsController < ApplicationController

  def show
    render 'login'
  end

  def create

    attemped_signin = User.new(login_params)
    match = false

    for i in User.all.each do
      if i.username == attemped_signin.username
        if i.password == attemped_signin.password
          match = true
        end
      end
    end

    if match == true
      Rails.application.config.user = attemped_signin
      redirect_to '/miscs' #TODO: make this redirect to the homepage
    end
  end

  def login_params

    return params.require(:login).permit(:username, :password)
  end
end
