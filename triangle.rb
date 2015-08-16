
#三角形の形を求める
class Triangle  
  # 【クラスメソッド】
  # 　→　3辺の値を判定する
  def self.kindofTriangle(hen1, hen2, hen3)
    #-- 不正入力チェック (ゼロ、マイナス値) 
    if (hen1 == 0)  or (hen1 < 0) or        
       (hen2 == 0)  or (hen2 < 0) or
       (hen3 == 0)  or (hen3 < 0)   
      return  "３辺の指定が未指定または不正な入力です＞＜"
    end

    if (hen1 < (hen2 + hen3)) and
       (hen2 < (hen1 + hen3)) and
       (hen3 < (hen1 + hen2))
      #-- 正三角形の場合
      if (hen1 == hen2) and
         (hen2 == hen3) 
        return "正三角形ですね！"
        #-- 二等辺三角形の場合
      elsif (hen1 == hen2) or
            (hen1 == hen3) or
            (hen2 == hen3)
        return  "二等辺三角形ですね！"
        #-- 不等辺三角形の場合
      else
        return  "不等辺三角形ですね！"
        #-- 三角形の成立条件を満たさない場合  
      end
    else
      return  "三角形じゃないです＞＜"
    end
  end
end

#三角形の形を求める
puts Triangle.kindofTriangle(ARGV[0].to_f, ARGV[1].to_f, ARGV[2].to_f)

