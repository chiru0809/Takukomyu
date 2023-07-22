module Public::PlayHistoresHelper
  def play_history_memo
    <<-"EOS".strip_heredoc
      GM：XXさん
      PL：○○○○
      PC：△△ △△△
      エンディングA
      ------------
      〜あらすじ〜
      .....
    EOS
  end
  
  def play_history_secret_memo
    <<-"EOS".strip_heredoc
      エンディングA □□□□
      
      入手アーティファクト
      ・XXXXX
      　効果：.....
      
      登場NPC
      ・△△ △△△(XX)
       .....
      
      ------------
      感想
       .....
      
    EOS
  end
end
