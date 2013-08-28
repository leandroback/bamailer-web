module Bamailer
  class AdminApp
    get '/admins' do
      @admins = UserAdmin.all
      haml :'admins/index'
    end

    get '/admins/new' do
      haml :'admins/new'
    end

    get '/admins/:id' do
      @admin = UserAdmin.find params[:id]
      haml :'admins/show'
    end

    get '/admins/:id/edit' do
      @admin = UserAdmin.find params[:id]
      haml :'admins/edit'
    end

    post '/admins/create' do
      admin = UserAdmin.new params[:admin]

      begin
        if admin.save
          flash[:notice] = "Administrador creado con exito."
        else
          flash[:error] = "Ocurrio un error."
        end
      rescue Exception => e
        flash[:error] = e.message
      end
      redirect :'/admin/admins'
    end

    put '/admins/:id' do
      admin = UserAdmin.find params[:id]
      admin.update_attributes params[:admin]

      if admin.save
        flash[:notice] = "Administrador actualizado con exito."
      else
        flash[:error] = "Ocurrio un error."
      end

      redirect :'/admin/admins'
    end

    delete '/admins/:id' do
      unless params[:id] == current_user.id.to_s
        admin = UserAdmin.find params[:id]
        admin.delete

        flash[:notice] = "El administrador fue borrado con exito."
        redirect :'/admin/admins'
      else
        flash[:error] = "No se puede eliminar al usuario actualmente logueado."
        redirect :'/admin/admins'
      end
    end
  end
end
