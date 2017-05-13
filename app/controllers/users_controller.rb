class UsersController < ApplicationController
   def show
   	 @user = User.find(params[:id])
   end

   def participate
     @userr = User.find(params[:id])
   end
    
end
