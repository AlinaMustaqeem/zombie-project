class UsersController < ApplicationController


def show

end

def home
  
end


def index
  if (!user_signed_in?)
    redirect_to new_user_registration_path
  elsif (current_user.inventory.nil?)
    redirect_to new_inventory_path
  else
    redirect_to user_path(current_user)
  end
end
end
