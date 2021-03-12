Book.destroy_all
User.destroy_all
Rating.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Book.create(
    [
      {title: "The Adventures of Huckleberry Finn", author: "Mark Twain", publisher: "Chatto & Windus / Charles L. Webster And Company", genre: "Picaresque novel", release_year: 1884},
      {title: "Goodnight Moon", author: "Margaret Wise Brown", publisher: "Harper & Brothers", genre: "Children's literature", release_year: 1947},
      {title: "The Fall of the House of Usher", author: "Edgar Allan Poe", publisher: "Burton's Gentleman's Magazine", genre: "Horror, Gothic", release_year: 1839}
    ]
)

  User.create(
      [
        {name: "bob", username: "bob123", email: "bob123@hotmail.com", password: "password1"},
        {name: "sam", username: "sam432", email: "sam432@yahoo.com", password: "password2"},
        {name: "grace", username: "grace50", email: "gracey@optonline.net", password: "password3"}
      ]
    )