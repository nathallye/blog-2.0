class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  # GET /posts or /posts.json
  def home
    @tags = Tag.all #.all = todos 
    @posts = Post.all #.all = todos
    @last_post = Post.last
  end 
  
  def index
    @tags = Tag.all #.all = todos 
    @posts = Post.where(tag_id: params["tag_id"]) #.where(tag_id: params["tag_id"]) = selecionar(atributo: params[""])
    # *params["tag_id"] = recuperamos esse parametro para exibir somente o item com sua respectiva tag de acordo com o id 
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @tags = Tag.all 
  end

  # GET /posts/1/edit
  def edit
    @tags = Tag.all #.all = todos
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)
    @tags = Tag.all #.all = todos

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :author, :body, :tag_id) #agora também criamos o parametro de tag_id
    end
end
