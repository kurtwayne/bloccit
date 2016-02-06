module UsersHelper
  def check_for_posts
    if @user.posts.count == 0
      "You have not submitted any posts yet."
    else
      render @user.posts
    end
  end

  def check_for_comments
    if @user.comments.count == 0
      "You have not submitted any comments yet."
    else
      render @user.comments
    end
  end

  def check_for_favorites
    if @user.favorites.count == 0
      "You have not favorited any posts yet."
    else
      render @user.favorites
    end
  end
end
