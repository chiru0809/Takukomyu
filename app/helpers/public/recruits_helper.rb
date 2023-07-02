module Public::RecruitsHelper
  def recruit_message
    <<-"EOS".strip_heredoc
      〜あらすじ〜
      .....
      
      初心者の方も歓迎です！
      参加希望の方はコメント欄またはtwitterに連絡ください。
      
      twitterユーザー名　@XXXXXX
    EOS
  end
end
