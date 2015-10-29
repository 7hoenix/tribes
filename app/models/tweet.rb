class Tweet < OpenStruct
  def retweeted?
    retweeted
  end

  def favorited?
    favorited
  end
end
