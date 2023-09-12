# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.create([
    {email: "taisei25864@gmail.com", password: "taisei012", name: "たいせい", birthday: "2003-01-17", introduction: "兵庫県住みです。お願いします。", profile_image:File.open("./app/assets/images/taisei.jpg")},
    {email: "kanatatsu64@gmail.com", password: "tatsuya012", name: "たつや", birthday: "2002-06-2", introduction: "学生です。お願いします。", profile_image:File.open("./app/assets/images/tatsuya.jpg")},
    {email: "greenwillow49@gmail.com", password: "yagi012", name: "やぎ", birthday: "2002-08-23", introduction: "エンジニアです。お願いします。", profile_image:File.open("./app/assets/images/yagi.jpg")},
    {email: "yusei530922@gmail.com", password: "yuse012", name: "ゆせ", birthday: "2002-09-4", introduction: "東京住みです。お願いします。", profile_image:File.open("./app/assets/images/yusei.jpg")},
])

recruitments = Recruitment.create([
    {user_id: 1, title: "ハッカソンメンバー募集", description: "フロントエンドのメンバー募集中です", image:File.open("./app/assets/images/hack.jpg"), area: "大阪", people_limit: "5", participants_count: "3"},
    {user_id: 2, title: "運動したい人集まれ", description: "誰でも歓迎です", image:File.open("./app/assets/images/activity.jpg"), area: "東京", people_limit: "20", participants_count: "14"},
    {user_id: 3, title: "Rails勉強会", description: "初心者歓迎です", image:File.open("./app/assets/images/rails.png"), area: "愛知", people_limit: "15", participants_count: "10"},
    {user_id: 4, title: "英会話勉強会", description: "英会話勉強したい人募集してます", image:File.open("./app/assets/images/english.jpg"), area: "沖縄", people_limit: "8", participants_count: "5"},
    {user_id: 1, title: "セキュリティ勉強会", description: "レベル高め", image:File.open("./app/assets/images/study.jpg"), area: "北海道", people_limit: "5", participants_count: "5"},
])

recruitment_targets = RecruitmentTarget.create([
    {recruitment_id: 1, title: "学生"},
    {recruitment_id: 1, title: "楽しくワイワイ"},
    {recruitment_id: 2, title: "誰でも歓迎"},
    {recruitment_id: 3, title: "社会人"},
    {recruitment_id: 3, title: "楽しくワイワイ"},
    {recruitment_id: 4, title: "社会人"},
    {recruitment_id: 4, title: "ハイレベル"},
]) 

