# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Genre.find_or_create_by!(name: "文学")
Genre.find_or_create_by!(name: "SF")
Genre.find_or_create_by!(name: "ミステリー")
Genre.find_or_create_by!(name: "ファンタジー")
Genre.find_or_create_by!(name: "民俗")
Genre.find_or_create_by!(name: "ホラー")
Genre.find_or_create_by!(name: "コミック")
Genre.find_or_create_by!(name: "陰謀論")
Genre.find_or_create_by!(name: "ライトノベル")
Genre.find_or_create_by!(name: "洋書")
Genre.find_or_create_by!(name: "雑誌")
