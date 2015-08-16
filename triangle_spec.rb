require "spec_helper"
require "triangle"

describe Triangle do
  describe "無効同値" do
    describe "【不正値】文字指定ありの場合" do
      it "すべてエラーの場合" do
        expect(Triangle.kindofTriangle("".to_f, "".to_f, "".to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "複数がエラーの場合" do    
        expect(Triangle.kindofTriangle(2.to_f, "a".to_f, "@".to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[0]がエラーの場合" do
        expect(Triangle.kindofTriangle("a".to_f, 3.to_f, 4.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[1]がエラーの場合" do
        expect(Triangle.kindofTriangle(2.to_f, "B".to_f, 4.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[2]がエラーの場合" do
        expect(Triangle.kindofTriangle(2.to_f, 3.to_f, "@".to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
    end
    describe "【不正値】ゼロ指定ありの場合" do
      it "すべてエラーの場合" do
        expect(Triangle.kindofTriangle(0.to_f, 0.to_f, 0.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "複数がエラーの場合" do    
        expect(Triangle.kindofTriangle(2.to_f, 0.to_f, 0.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[0]がエラーの場合" do
        expect(Triangle.kindofTriangle(0.to_f, 3.to_f, 4.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[1]がエラーの場合" do
        expect(Triangle.kindofTriangle(2.to_f, 0.to_f, 4.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[2]がエラーの場合" do
        expect(Triangle.kindofTriangle(2.to_f, 3.to_f, 0.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
    end
    describe "【不正値】マイナス指定ありの場合" do
      it "すべてエラーの場合" do
        expect(Triangle.kindofTriangle(-1.to_f, -2.to_f, -3.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "複数がエラーの場合" do    
        expect(Triangle.kindofTriangle(2.to_f, -2.to_f, -3.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[0]がエラーの場合" do
        expect(Triangle.kindofTriangle(-1.to_f, 3.to_f, 4.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[1]がエラーの場合" do
        expect(Triangle.kindofTriangle(2.to_f, -1.to_f, 4.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
      it "[2]がエラーの場合" do
        expect(Triangle.kindofTriangle(2.to_f, 3.to_f, -2.to_f)).to eq "３辺の指定が未指定または不正な入力です＞＜"
      end
    end
    # 三角形の成立条件：一番長い辺　<　残りの二辺の和
    describe "【不正値】三角形の成立条件を満たさない場合" do
      it "[0]=[1]+[2]" do
        expect(Triangle.kindofTriangle(3.to_f, 1.to_f, 2.to_f)).to eq "三角形じゃないです＞＜"
      end
      it "[1]=[0]+[2]" do    
        expect(Triangle.kindofTriangle(1.to_f, 3.to_f, 2.to_f)).to eq "三角形じゃないです＞＜"
      end
      it "[2]=[0]+[1]" do
        expect(Triangle.kindofTriangle(1.to_f, 2.to_f, 3.to_f)).to eq "三角形じゃないです＞＜"
      end
      it "[0]>[1]+[2]" do
        expect(Triangle.kindofTriangle(4.to_f, 1.to_f, 1.to_f)).to eq "三角形じゃないです＞＜"
      end
      it "[1]>[0]+[2]" do    
        expect(Triangle.kindofTriangle(1.to_f, 3.to_f, 1.to_f)).to eq "三角形じゃないです＞＜"
      end
      it "[2]>[0]+[1]" do
        expect(Triangle.kindofTriangle(1.to_f, 1.to_f, 3.to_f)).to eq "三角形じゃないです＞＜"
      end
   end
  end
  describe "有効同値" do
    describe "三辺が同じ値の場合" do
      it "すべて整数" do
        expect(Triangle.kindofTriangle(1.to_f, 1.to_f, 1.to_f)).to eq "正三角形ですね！"
      end
      it "すべて少数" do    
        expect(Triangle.kindofTriangle(1.1.to_f, 1.1.to_f, 1.1.to_f)).to eq "正三角形ですね！"
      end
    end
    describe "二辺が同じ値の場合" do
      it "[0]=[1]" do
        expect(Triangle.kindofTriangle(2.to_f, 2.to_f, 1.to_f)).to eq "二等辺三角形ですね！"
      end
      it "[1]=[2]" do    
        expect(Triangle.kindofTriangle(1.to_f, 2.to_f, 2.to_f)).to eq "二等辺三角形ですね！"
      end
      it "[0]=[2]" do
        expect(Triangle.kindofTriangle(2.to_f, 1.to_f, 2.to_f)).to eq "二等辺三角形ですね！"
      end
    end
    describe "三辺が違う値の場合" do
      it "[0]=[1]" do
        expect(Triangle.kindofTriangle(2.to_f, 3.to_f, 4.to_f)).to eq "不等辺三角形ですね！"
      end
      it "[1]=[2]" do    
        expect(Triangle.kindofTriangle(4.4.to_f, 2.2.to_f, 3.3.to_f)).to eq "不等辺三角形ですね！"
      end
      it "[0]=[2]" do
        expect(Triangle.kindofTriangle(3.to_f, 4.to_f, 2.to_f)).to eq "不等辺三角形ですね！"
      end
    end

  end
end
