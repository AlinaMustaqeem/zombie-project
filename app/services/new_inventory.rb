# frozen_string_literal: true
# class NewInventory
#   def initialize(param)

#     @params = param
#   end

#   def qty
#     @inventory = Inventory.new(@params)
#     return @inventory.save
#   end

# In Inventory_controller (create action if using this service)
#   if NewInventory.new(inventory_params).qty
#     redirect_to user_path(current_user.id), notice: 'saved succesfuly'
#   else
#     render 'new', alert: 'Please Enter Inventory'
#   end
# end

# end
