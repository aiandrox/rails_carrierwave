class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :page_back, only: %i[create update], if: -> { params[:commit] == 'Back' }

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def edit; end

  def create
    @post = Post.new(post_params)
    retrieve_image_from
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    @post.assign_attributes(post_params)
    if @post.image_cache.present?
      @post.image.cache_stored_file!
      @post.image.retrieve_from_cache! @post.image_cache
      @post.image.recreate_versions!
    end
    if @post.save
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  def confirm
    case params[:commit]
    when 'Create Post'
      @post = Post.new(post_params)
      image_confirm
      render :new if @post.invalid?
    when 'Update Post'
      set_post
      @post.assign_attributes(post_params)
      if @post.image_cache.present?
        @post.image.cache_stored_file!
        @post.image.retrieve_from_cache! @post.image_cache
        @post.image_cache = @post.image.cache_name
        @post.image.recreate_versions!
      end
      render :edit if @post.invalid?
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :image_cache)
  end

  def page_back
    case action_name
    when 'create'
      @post = Post.new(post_params)
      retrieve_image_from
      render :new
    when 'update'
      @post.assign_attributes(post_params)
      @post.image.retrieve_from_cache! @post.image_cache if @post.image_cache.present?
      render :edit
    end
  end

  def retrieve_image_from(cache = @post.image_cache)
    @post.image.retrieve_from_cache! cache if cache.present? && @post.image.blank?
  end

  def image_confirm
    retrieve_image_from unless params[:post][:remove_image] == '1'
    @post.image_cache = @post.image.cache_name
  end
end
