# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Limpar dados anteriores (opcional)
Order.destroy_all
Cart.destroy_all
Product.destroy_all
User.destroy_all

# Criar usuário
user = User.create!(
  email: "user@example.com",
  password: "123456",
  nickname: "User Test",
  role: :admin
)

#Adicionar foto de perfil ao usuário
user.photo.attach(
  io: File.open(Rails.root.join("app/assets/images/avatarshoes.png")),
  filename: "avatarshoes.png"
)

# Array de produtos
products = [
  {
    name: "Jacket",
    description: "Jaqueta muito estilosa para frio.",
    price: 49.90,
    categories: "Jacket",
    images: ["jacket.webp"]
  },
  {
    name: "Jeans blue",
    description: "Jeans masculino para dia a dia.",
    price: 119.90,
    categories: "Other",
    images: ["jeans.webp"]
  },
  {
    name: "Nike Dunk",
    description: "Nike Dunk Panda ColorWay.",
    price: 299.90,
    categories: "Other",
    images: ["tenis3.webp"]
  },
  {
    name: "T-shirt",
    description: "T-shirt básica para o dia a dia.",
    price: 29.90,
    categories: "T-shirt",
    images: ["t-shirt.webp"]
  }
]

# Criar produtos com fotos
products.each do |prod|
  product = Product.create!(
    name: prod[:name],
    description: prod[:description],
    price: prod[:price],
    categories: prod[:categories],
    user: user
  )
  prod[:images].each do |img|
    product.photos.attach(
      io: File.open(Rails.root.join("app/assets/images/#{img}")),
      filename: img
    )
  end
end

puts "Seed finalizado com sucesso ✅"
