module Bamailer
  class AdminApp
    get '/users' do
      @users = User.all
      haml :'users/index'
    end

    get '/users/new' do
      haml :'users/new'
    end

    get '/users/:id' do
      @user = User.find params[:id]
      haml :'users/show'
    end

    get '/users/:id/edit' do
      @user = User.find params[:id]
      haml :'users/edit'
    end

    post '/users/create' do
      user = User.new params[:user]

      begin
        if user.save
          flash[:notice] = "Usuario creado con exito."
        else
          flash[:error] = "Ocurrio un error."
        end
      rescue Exception => e
        flash[:error] = e.message
      end
      redirect :'/admin/users'
    end

    put '/users/:id' do
      user = User.find params[:id]
      user.update_attributes params[:user]

      if user.save
        flash[:notice] = "Usuario actualizado con exito."
      else
        flash[:error] = "Ocurrio un error."
      end

      redirect :'/admin/users'
    end

    delete '/users/:id' do
      user = User.find params[:id]
      user.delete

      flash[:notice] = "El usuario fue borrado con exito."
      redirect :'/admin/users'
    end
  end
end
