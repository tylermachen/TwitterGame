class SessionsController < ApplicationController

  def create
    @account = Account.find_or_create_from_auth_hash(auth_hash)
    session[:account_id] = @account.id
    redirect_to '/game'
  end

  def logout
    session[:account_id] = nil
    session[:republican_default] = nil
    session[:democrat_default] = nil
    session[:jerseyshore_default] = nil

    redirect_to '/'


  end

  protected

   def auth_hash
     request.env['omniauth.auth']
   end
end
