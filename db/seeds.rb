Book.destroy_all
User.destroy_all

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create(
  [
    {title: "The Adventures of Huckleberry Finn", author: "Mark Twain", publisher: "Chatto & Windus / Charles L. Webster And Company", genre: "Picaresque novel", score: 10, release_year: 1884},
    {title: "Goodnight Moon", author: "Margaret Wise Brown", publisher: "Harper & Brothers", genre: "Children's literature", score: 9, release_year: 1947},
    {title: "The Fall of the House of Usher", author: "Edgar Allan Poe", publisher: "Burton's Gentleman's Magazine", genre: "Horror, Gothic", score: 8, release_year: 1839}
  ])
