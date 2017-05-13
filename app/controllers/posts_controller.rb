class PostsController < ApplicationController

   before_action :authenticate_user!, only: ['edit', 'create', 'delete']
   #before_action :verify_role, only: ['create'] 

  def index
  	@posts = Post.all 
  end

  def new
  	@post=Post.new
  end
  def edit
  	@post=Post.find(params[:id])
  end
  def show
  	@post = Post.find(params[:id])
    @posts = Post.all
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
    end
  end	
  
  def create
  #render plain: params[:posts].inspect 
    #@rol=User.role
    @post = Post.new(post_params)
    # automatically add the creator of the event as an attending member
   # @post.post_members.build({invitee: current_user, rsvp_status: :attending})
    if @post.save
       redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post=Post.find(params[:id])
    if @post.update(post_params)
       redirect_to @post
     else
      render 'edit'
    end
  end

  #def verify_role
  #	if current_user.role.name == 'user'
   # end

  #end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to post_path
  end

  def feed
    @post = Post.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
    end


  private
  def post_params
    params.require(:post).permit(:title, :text, :start_time, :end_time)
  end
  
  end


