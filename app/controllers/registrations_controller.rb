class RegistrationsController < ApplicationController

  def show

    render 'register'
  end

  def create

    attemped_register = User.new(registration_parameters)
    already_taken = false

    for i in User.all.each do #determines if the username is already taken
      if attemped_register.username == i.username
        already_taken = true
      end
    end

    if already_taken == false
      attemped_register.save

      redirect_to '/logins/'
    end

  if already_taken
    puts "Sorry, that username was already taken!"
  end


  end

  def registration_parameters
    params.require(:register).permit(:username,:password)
  end

end
