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
      @participation = Participation.destroy(find_params[:id])
      @participation.destroy
      respond_to do |format|
        format.html { redirect_to @event, notice: 'You are no longer attending this event.' }
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
