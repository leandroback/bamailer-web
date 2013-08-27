module Bamailer
  class AdminApp
    get "/sessions/login" do
      haml :'../sessions/login'
    end

    post "/sessions/login" do
      if login(UserAdmin, params[:username], params[:password])
        # remember(authenticated(UserAdmin)) if params[:remember]
        flash[:notice] = "Welcome"
        redirect(params[:return] || "/")
      else
        flash[:error] = 'Nombre de usuario y/o contrasenias incorrectas.'
        haml :'../sessions/login'
      end
    end

    get "/sessions/logout" do
      logout(UserAdmin)
      redirect "/"
    end
  end
end