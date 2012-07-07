# This will calculate total merits for the current user, to be run on login

# personal_merits = @current_user.pmerits #=> users earn this by logging in, creating posts and convos, and direct allocation from other users
# 
# #The next section will identify merits derived from the quality (as indicated by number of merits) of convos and posts
# 
# convo_merits = 0
# post_merits = 0
# @current_user.convos.each{|convo| convo_merits+=@convo.merits}
# @current_user.posts.each{|post| post_merits+=@post.merits}
# quality_merits = (convo_merits + post_merits)/5
# 
