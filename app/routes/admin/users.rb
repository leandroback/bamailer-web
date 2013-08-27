module Bamailer
  class AdminApp
    get '/users' do
      @users = User.all
      haml :'users/index'
    end

    get '/users/:id/delete' do
      User[params[:id]].delete
      flash[:notice] = "El usuario fue borrado"
      redirect '/admin/users', layout: :admin_layout
    end

    get '/users/:id/links' do
      @user = User[params[:id]]
      @links = @user.links
      haml :'users/links', layout: :admin_layout
    end

  end
end
