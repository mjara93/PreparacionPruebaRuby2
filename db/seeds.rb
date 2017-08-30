# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# eliminar todos los registros
Category.destroy_all
#crear 3 registros en category
Category.create([{name: 'higiene'},{name: 'abarrotes'},{name: 'aire libre'}])
# agregar producto con su llave foranea con build
cat = Category.find_by(name: 'abarrotes')
cat.products.build(name: 'pasta').save
# agregar productos con create
Product.create(name: 'patines', category_id: Category.find_by(name: 'aire libre').id)
# eliminar ultimo producto
Product.last.destroy
# actualizar registro premium a true
pro = Product.last
pro.premium = true
pro.save
# actualizar todos los registros name a mayusculas
cat = Category.all
cat.each do |category|
    category.name = category.name.upcase
    category.save
end