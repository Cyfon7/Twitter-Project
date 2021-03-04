ActiveAdmin.register User do
    permit_params :name, :email, :password, :password_confirmation

    

    index do
        selectable_column
        id_column
        column :name
        column :email
        column "Following" do |user|
            user.friends.count
        end
        column "Tweets" do |user|
            user.tweets.count
        end
        column "Likes" do |user|
            user.likes.count
        end
        column "Retweets" do |user|
            user.tweets.pluck(:tweet_id).reject{ |v| v == nil }.count
        end
        actions
    end
  
    filter :name
    filter :email
    


    form do |f|
      f.inputs do
        f.input :name
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end
end