helpers do

def current_user
@current_user ||= Player.find_by(id: session[:user_id])
end


def logged_in?
session[:user_id] != nil
end

def authenticate!
redirect '/login' unless logged_in?
end


def match_ids(object_id)
  if logged_in?
    current_user.id == object_id
  end
end

end
