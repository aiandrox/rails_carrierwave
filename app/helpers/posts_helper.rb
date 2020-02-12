module PostsHelper
  def confirm_path
    if @post.new_record?
      confirm_post_path(params[:id])
    else
      confirm_posts_path
    end
  end

  def confirmed_path
    if @post.new_record?
      post_path(params[:id])
    else
      posts_path
    end
  end

  def confirmed_method
    if @post.new_record?
      'patch'
    else
      'post'
    end
  end
end
