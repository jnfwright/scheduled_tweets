class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)    
    #Tweet already published
    return if tweet.published?

    # Publish time rescheduled to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end
