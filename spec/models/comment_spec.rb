require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "バリデーションチェック" do
    context "成功パターン" do
      it "設定したすべてのバリデーションが機能しているか" do
        # バリデーションだけ確認したいため、buildを使用したインスタンスを生成する
        comment = build(:comment)
        # このcommentインスタンスが有効かテストする
        expect(comment).to be_valid
      end
    end

    context "失敗パターン" do
      it "bodyが空の場合にバリデーションが機能してinvalidになるか" do
        comment = build(:comment, body: nil)
        expect(comment).to be_invalid
        expect(comment.errors[:body]).to include("を入力してください")
      end

      it "bodyが65536文字以上の場合にバリデーションが機能してinvalidになるか" do
        comment = build(:comment, body: "あ" * 65_536)
        expect(comment).to be_invalid
        expect(comment.errors[:body]).to include("は65535文字以内で入力してください")
      end
    end
  end
end
