# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@icloud.com',
  password: "aaaaaa"
)

 Genre.create!(
    name: "音楽",
    is_valid: [['有効', true],['無効', false]]
  )

  Genre.create!(
    name: "ゲーム",
    is_valid: [['有効', true],['無効', false]]
  )

  Genre.create!(
    name: "アニメ",
    is_valid: [['有効', true],['無効', false]]
  )

  Genre.create!(
    name: "旅行",
    is_valid: [['有効', true],['無効', false]]
  )

  Project.create!(
    genre_id: 1,
    name: "パンクライブ",
    description: "パンクミュージックのライブです。",
    price: "500",
    image: open("./app/assets/images/punk.jpg"),
    is_active: [['販売中', true], ['販売停止', false]],
    expired_at: "2021.07.21",
    end_time: "2021.07.14",
    count_limid: "30"
  )