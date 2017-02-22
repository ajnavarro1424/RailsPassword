class PasswordController < ApplicationController

  def result
    # Flashes go here, with response to credentials
    # Checks to see if username and password are the same
    @username = params[:username]
    @password = params[:password]



    def same
      @username != @password
    end
    # Checks to see if the username and password and long enough
    def long_enough
      @username.length >= 6 && @password.length >= 6
    end
    # Checks the username ID and password and returns true is all conditions are met and false if either is invalid.
    def cred_check
      username_check && password_check && same && long_enough
    end
    if @username.nil? || @password.nil?
      #Display something
    else
      cred_check ? flash.now[:alert] = "Your creds look solid, friend." : flash.now[:notice] = "Your creds look mighty fishy, fella."

    end
  end

  # Checks the username for validity
  def username_check
    @username = params[:username]

    # Checks to make sure the username does not include special characters or spaces
    def username_chars()
      (@username =~ /[!#\$]/).nil? #nil means there are none of those characters in the username
    end
    username_chars
  end #username_check end

  # Checks the password for validity
  def password_check
    @password = params[:password]
    # Checks to ensure that the password does not include the word 'password' and ensures it contains at least 1 special character.
    def password_chars
      @password.downcase != "password" || !(@password=~/[!#\$][0-9][a-z][A-Z]/).nil?
    end
    password_chars

  end

  def clear
    params.delete :username
    params.delete :password
    redirect_to '/result'

  end

end #Class End
