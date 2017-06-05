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
    @participating = @post.participating?(current_user)
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
 
    redirect_to posts_path
  end

  def feed
    @post = Post.all
    respond_to do |format|
      format.rss { render :layout => false }
    end
    end

   def myparticipations
     @posts = current_user.posts
   end

   def join

     unless user_signed_in?
       render plain: post.errors.messages
       return
     end

     @post = Post.find(params[:id])

     participation = Participation.new(post: @post, user: current_user)

     if participation.save
       redirect_to @post, notice: "Thanks for joining this event! See you there!"

     else
       render file: "public/404", status: 404, formats: [:html]
     end
   end



  private
  def post_params
    params.require(:post).permit(:title, :text, :start_time, :end_time)
  end

  end


