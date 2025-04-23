# db/seeds.rbは、開発環境やテスト環境で使用するデータベースの初期データを設定するためのファイルです。
# このファイルに記述された内容は、rails db:seedコマンドを実行することでデータベースに適用されます。
# 例えば、ユーザー情報やサンプルデータなど、アプリケーションの動作確認やテストに必要なデータを一括で生成することができます。
# これにより、開発者は手動でデータを入力する手間を省き、効率的に開発を進めることができます。

# 以下のコードは、gem 'faker'を使用してランダムなユーザーと掲示板レコードを生成します。
10.times do
  User.create!(last_name: Faker::Name.last_name,
              first_name: Faker::Name.first_name,
              email: Faker::Internet.unique.email,
              password: "password",
              password_confirmation: "password")
end

user_ids = User.ids

20.times do |index|
  user = User.find(user_ids.sample)
  user.boards.create!(title: "タイトル#{index}", body: "本文#{index}")
end
