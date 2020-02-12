module PostsHelper
  def confirm_path
    if @post.new_record?
      confirm_posts_path
    else
      confirm_post_path(params[:id])
    end
  end

  def confirmed_path
    if @post.new_record?
      posts_path
    else
      post_path(params[:id])
    end
  end

  def confirmed_method
    if @post.new_record?
      'post'
    else
      'patch'
    end
  end
end
