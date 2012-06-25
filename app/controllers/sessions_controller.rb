class SessionsController < Devise::SessionsController
  after_filter :update_user_merits, :only =>[:create]
  def create
    redirect_to :back
  end
  def destroy
  redirect_to :back
  end
  
  def update_user_merits
    # This will calculate total merits for the current user, to be run on login

    personal_merits = current_user.umerits #=> users earn this by logging in, creating posts and convos, and direct allocation from other users

    #The next section will identify merits derived from the quality (as indicated by number of merits) of convos and posts

    convo_merits = 0
    post_merits = 0
    current_user.convos.each{|convo| convo_merits+=convo.merits}
    current_user.posts.each{|post| post_merits+=post.merits}
    quality_merits = (convo_merits + post_merits)/5

    current_user.merits = personal_merits + quality_merits
    
    current_user.save
    
    #update ranks
    
  end
end
