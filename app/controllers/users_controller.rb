class UsersController < ApplicationController
   def show
   	 @user = User.find(params[:id])
   end

   def participate
     @user = User.find(params[:id])
   end
    
end
