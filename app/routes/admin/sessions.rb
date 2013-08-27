module Bamailer
  class AdminApp
    get '/sessions/login' do
      haml :'../sessions/login', layout: :'login_layout'
    end

    post '/sessions/login' do
      if login(UserAdmin, params[:email], params[:password])
        # remember(authenticated(UserAdmin)) if params[:remember]
        flash[:notice] = 'Welcome'
        redirect(params[:return] || :'/admin/users')
      else
        flash[:error] = 'Nombre de usuario y/o contrasenias incorrectas.'
        haml :'../sessions/login', layout: :'login_layout'
      end
    end

    get '/sessions/logout' do
      logout(UserAdmin)
      redirect '/admin'
    end
  end
end