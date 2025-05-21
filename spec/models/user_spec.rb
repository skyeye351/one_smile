require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションチェック" do
    context "成功パターン" do
      it "すべてのバリデーションを満たせば有効になる" do
        user = build(:user)
        expect(user).to be_valid
      end

      it "emailがユニークであれば登録できる" do
        create(:user, email: "taro@example.com")
        another_user = build(:user, email: "hanako@example.com")
        expect(another_user).to be_valid
      end
    end

    context "失敗パターン" do
      it "first_nameが空の場合にバリデーションが機能してinvalidになるか" do
        user = build(:user, first_name: nil)
        expect(user).to be_invalid
        expect(user.errors[:first_name]).to include("を入力してください")
      end

      it "first_nameが256文字以上の場合にバリデーションが機能してinvalidになるか" do
        user = build(:user, first_name: "あ" * 256)
        expect(user).to be_invalid
        expect(user.errors[:first_name]).to include("は255文字以内で入力してください")
      end

      it "last_nameが空の場合にバリデーションが機能してinvalidになるか" do
        user = build(:user, last_name: nil)
        expect(user).to be_invalid
        expect(user.errors[:last_name]).to include("を入力してください")
      end

      it "last_nameが256文字以上の場合にバリデーションが機能してinvalidになるか" do
        user = build(:user, last_name: "あ" * 256)
        expect(user).to be_invalid
        expect(user.errors[:last_name]).to include("は255文字以内で入力してください")
      end

      it "emailが空だと無効になる" do
        user = build(:user, email: nil)
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("を入力してください")
      end

      it "emailが重複していると無効になる" do
        create(:user, email: "taro@example.com")
        another_user = build(:user, email: "taro@example.com")
        expect(another_user).to be_invalid
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end

      it "passwordが3文字未満だと無効になる" do
        user = build(:user, password: "ab", password_confirmation: "ab")
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("は3文字以上で入力してください")
      end

      it "password_confirmationが空の場合にバリデーションが機能してinvalidになるか" do
        user = build(:user, password_confirmation: nil)
        expect(user).to be_invalid
        expect(user.errors[:password_confirmation]).to include("を入力してください")
      end
    end
  end
end
