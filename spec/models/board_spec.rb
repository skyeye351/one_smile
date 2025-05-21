require "rails_helper"

RSpec.describe Board, type: :model do
  describe "バリデーションチェック" do
    context "成功パターン" do
      it "設定したすべてのバリデーションが機能しているか" do
        board = build(:board)
        expect(board).to be_valid
      end
    end

    context "失敗パターン" do
      it "titleが空の場合にバリデーションが機能してinvalidになるか" do
        board = build(:board, title: nil)
        expect(board).to be_invalid
        expect(board.errors[:title]).to include("を入力してください")
      end

      it "bodyが空の場合にバリデーションが機能してinvalidになるか" do
        board = build(:board, body: nil)
        expect(board).to be_invalid
        expect(board.errors[:body]).to include("を入力してください")
      end

      it "titleが256文字以上の場合にバリデーションが機能してinvalidになるか" do
        board = build(:board, title: "あ" * 256)
        expect(board).to be_invalid
        expect(board.errors[:title]).to include("は255文字以内で入力してください")
      end

      it "bodyが65536文字以上の場合にバリデーションが機能してinvalidになるか" do
        board = build(:board, body: "あ" * 65_536)
        expect(board).to be_invalid
        expect(board.errors[:body]).to include("は65535文字以内で入力してください")
      end
    end
  end
end
