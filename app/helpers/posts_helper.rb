module PostsHelper
  def confirm_path
    if Post.exists?(@post.id)
      confirm_post_path(params[:id])
    else
      confirm_posts_path
    end
  end

  def confirmed_path
    if Post.exists?(@post.id)
      post_path(params[:id])
    else
      posts_path
    end
  end

  def confirmed_method
    if Post.exists?(@post.id)
      'patch'
    else
      'post'
    end
  end
end
