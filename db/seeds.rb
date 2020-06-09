# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 食品
food = Category.create(name: "食品")
food_1 = food.children.create(name: "野菜")
food_1.children.create([{name: "レタス"},{name: "ブロッコリー"},{name: "白菜"},{name: "にんじん"},{name: "玉ねぎ"},{name: "じゃがいも"},{name: "カボチャ"},{name: "きゅうり"},{name: "トマト"},{name: "大根"},{name: "ミョウガ"},{name: "ピーマン"},{name: "長ネギ"},{name: "オクラ"},{name: "なす"},{name: "青じそ"},{name: "レンコン"},{name: "その他"}])
food_2 = food.children.create(name: "魚介類")
food_2.children.create([{name: "鯛"},{name: "カツオ"},{name: "たこ"},{name: "いか"},{name: "えび"},{name: "鮭"},{name: "タラ"},{name: "さば"},{name: "ブリ"},{name: "ホッケ"},{name: "しじみ"},{name: "しらす"},{name: "、マグロ"},{name: "うなぎ"},{name: "ホタテト"},{name: "その他"}])
food_3 = food.children.create(name: "肉類")
food_3.children.create([{name: "牛肩ロース"},{name: "牛肩バラ"},{name: "牛肩ロース"},{name: "牛モモ"},{name: "鳥もも"},{name: "ササミ"},{name: "鳥むね"},{name: "豚ロース"},{name: "豚バラ"},{name: "豚モモ"},{name: "豚小間切"},{name: "その他"}])
food_4 = food.children.create(name: "乳製品")
food_4.children.create([{name: "牛乳"},{name: "ヨーグルト"},{name: "マーガリン"},{name: "チーズ"},{name: "生クリーム"},{name: "卵"},{name: "その他"}])
food_5 = food.children.create(name: "米・麺類")
food_5.children.create([{name: "うどん"},{name: "そば"},{name: "パスタ"},{name: "そうめん"},{name: "あきたこまち"},{name: "コシヒカリ"},{name: "ゆめぴかり"},{name: "その他"}])
food_6 = food.children.create(name: "水物・練物")
food_6.children.create([{name: "豆腐"},{name: "納豆"},{name: "らっきょう"},{name: "梅干し"},{name: "たくあん"},{name: "油揚げ"},{name: "こんにゃく"},{name: "しらたき"},{name: "めかぶ"},{name: "その他"}])
food_7 = food.children.create(name: "パン関連・シリアル")
food_7.children.create([{name: "ジャム"},{name: "シリアル"},{name: "はちみつ"},{name: "洋菓子"},{name: "和菓子"},{name: "パン"},{name: "その他"}])
food_8 = food.children.create(name: "調味料")
food_8.children.create([{name: "醤油"},{name: "みりん"},{name: "料理酒"},{name: "砂糖"},{name: "塩"},{name: "酢"},{name: "ポン酢"},{name: "その他"}])
food_9 = food.children.create(name: "乾物・粉類")
food_9.children.create([{name: "天ぷら粉"},{name: "片栗粉"},{name: "小麦粉"},{name: "その他"}])
food_10 = food.children.create(name: "その他")
food_10.children.create([{name: "すべて"}])

# 飲料
drink = Category.create(name: "飲料")
drink_1 = drink.children.create(name: "コーヒー・茶類")
drink_1.children.create([{name: "インスタントコーヒ"},{name: "紅茶"},{name: "ココア"},{name: "緑茶"},{name: "麦茶"},{name: "烏龍茶"},{name: "健康茶"},{name: "その他"}])
drink_2 = drink.children.create(name: "ジュース")
drink_2.children.create([{name: "野菜ジュース"},{name: "オレンジジュース"},{name: "リンゴジュース"},{name: "カルピス"},{name: "その他"}])
drink_3 = drink.children.create(name: "酒類")
drink_3.children.create([{name: "ワイン"},{name: "洋酒"},{name: "梅酒"},{name: "清酒"},{name: "ビール"},{name: "サワー"},{name: "ノンアルコール"},{name: "その他"}])

# 日用品
daily = Category.create(name: "日用品")
daily_1 = daily.children.create(name: "キッチン用品")
daily_1.children.create([{name: "サランラップ"},{name: "パック"},{name: "ジップロック"},{name: "キッチンペーパー"},{name: "アルミホイル"},{name: "その他"}])
daily_2 = daily.children.create(name: "洗濯用品")
daily_2.children.create([{name: "洗濯用洗剤"},{name: "柔軟剤"},{name: "ハイター"},{name: "洗濯槽クリーナー"},{name: "その他"}])
daily_3 = daily.children.create(name: "紙類")
daily_3.children.create([{name: "トイレットペーパー"},{name: "ティッシュペーパー"},{name: "ウェットティッシュ"},{name: "その他"}])
daily_4 = daily.children.create(name: "化粧類")
daily_4.children.create([{name: "洗顔"},{name: "クレンジング"},{name: "ワックス"},{name: "日焼け止め"},{name: "その他"}])
daily_5 = daily.children.create(name: "ベビー用品")
daily_5.children.create([{name: "おむつ"},{name: "離乳食"},{name: "ミルク"},{name: "お尻ふき"},{name: "その他"}])

# その他
others = Category.create(name: "その他")
others_1 = others.children.create(name: "まとめ売り")
others_1.children.create([{name: "すべて"}])
others_2 = others.children.create(name: "ペット用品")
others_2.children.create([{name: "ペットフード"},{name: "犬用品"},{name: "猫用品"},{name: "魚用品/水草"},{name: "小動物用品"},{name: "爬虫類/両生類用品"},{name: "かご/おり"},{name: "鳥用品"},{name: "虫類用品"},{name: "その他"}])
others_3 = others.children.create(name: "その他")
others_3.children.create([{name: "すべて"}])