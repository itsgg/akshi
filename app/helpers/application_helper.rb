module ApplicationHelper
  include Pagy::Frontend

  def active?(type)
    path = request.env['PATH_INFO']
    return path == '/signup' if type == :signup
    return path == '/login' if type == :login
    return path == '/subjects/new' if type == :subjects_new
    return path.include?('/admin') if type == :admin
    return path == '/admin' if type == :admin_root
    return path == '/admin/users' if type == :admin_users
  end
end
