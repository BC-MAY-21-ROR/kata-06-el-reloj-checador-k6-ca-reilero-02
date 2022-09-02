# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Store.delete_all
Store.create(name: "Tienda Principal", address: "Calle del centro 101")
Store.create(name: "Tienda 02", address: "Calle rural 13452")
Store.create(name: "Tienda 03", address: "Calle equis 1405")
Store.create(name: "Tienda 04", address: "Calle zeta 6785431")