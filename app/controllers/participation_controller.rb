class ParticipationController < ApplicationController
  def index
  end

  def show
    @participation = Participation.all
  end

  def create


  end


  def edit
  end

  def update
  end

  def new
    @participation = Participation.new
    #@participation.user = current_user
  end
  def destroy
    #@participation.user = current_user
   # @participation = Participation.find(params[:id])
    #@participation.destroy
    #respond_to do |format|
     #format.html { redirect_to posts_path, notice: 'You are no longer attending this event.' }
      #format.json { head :no_content }
      #@post = Post.find(params[:id])
      #@id= Participation.find(params[:id]).id
      #@uid=User.find(params[:id]).id
      @participation = Participation.first.destroy
      @participation.destroy
      respond_to do |format|
        format.html { redirect_to myparticipations_path, notice: 'You are no longer attending this event.' }
        format.json { head :no_content }
      end
    end
     #@participation.find(params[:id]).destroy
     #respond_to do |format|
      # format.html { redirect_to posts_path, notice: 'You are no longer attending this event.' }
     #  format.json { head :no_content }
    #end
  #end


end
