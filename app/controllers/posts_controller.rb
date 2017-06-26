class PostsController < ApplicationController

  #before_filter ->{ authenticate_user!( force: true ) }

  before_action :authenticate_user!, only: ['edit', 'create', 'delete']
   #before_action :verify_role, only: ['create']

  def index
  	@posts = Post.all
   # @user= User.find(params[:id])
    @users= User.all
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
  def show_users
    @users = User.all()
    @posts = Post.all()
  end

  
  def create
    @post = Post.new(post_params)
    if @post.save
       redirect_to @post
    else
      render 'new'
    end
    #@post.current_user = current_user
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
     @posts = Post.all
   end

   def join
     unless user_signed_in?
       render plain: post.errors.messages
       return
     end
     @post = Post.find(params[:id])
     participation = Participation.new(post: @post, user: current_user)
     if participation.save
       redirect_to @post, notice: "Multumim pentru inscrierea la eveniment!"
     else
       render file: "public/404", status: 404, formats: [:html]
     end
   end



  private
  def post_params
    params.require(:post).permit(:title, :text, :start_time, :end_time)
  end

  end


