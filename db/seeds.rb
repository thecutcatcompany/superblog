
#Tarea 10: Crear 5 usuarios

#Ej: con 5 Times
#5.times do |nusuario|
#  us = User.new
#  us.first_name = "Usuario 1"
#  us.last_name = "Sovino"
#  us.email_address = "correo@gmail.com"
#  us.save()
#end

1.upto(5) do |nusuario|
  t = User.new
  t.first_name = "Usuario #{nusuario}"
  t.last_name = "Fuentes"
  t.email_address = "mail@gmail.com"
  t.save()
end


puts "Usuarios creados: #{User.all.count}"
puts "Tarea 10. Hecha."

#Tarea 11: Crear 5 blog

1.upto(5) do |nblog|
  b = Blog.new
  b.name = "Blog #{nblog}"
  b.description = "Descripcion"
  b.save()
end

#base creacion
#t = Blog.new
#t.name = "Blog 1"
#t.description = "Descripcion blog 1"
#t.save()

puts "Blogs creados: #{Blog.all.count}"
puts "Tarea 11. Hecha."

#Tarea 12: Esteblecer que los tres primeros blog pertenezcan al primer usuario.

1.upto(3) do |nblog|
  ow = Owner.new
  ow.user = User.where(first_name: "Usuario 1").first
  ow.blog = Blog.where(name: "Blog #{nblog}").first
  ow.save()
end

#Base
#ow = Owner.new
#ow.blog = Blog.where(name: "Blog 2").first
#ow.user = User.where(first_name: "Usuario 1").first
#ow.save

puts User.where(first_name: "Usuario 1").first.owner
puts "Tarea 12. Hecha."

#Tarea 13: Establecer que el blog 4, pertenezcan al segundo usuario

ow = Owner.new
ow.user = User.where(first_name: "Usuario 2").first
ow.blog = Blog.where(name: "Blog 4").first
ow.save

puts "# de propiedades: #{User.where(first_name: "Usuario 2").first.owner.count}"
## de propiedades: 3

puts "El blog 4 esta asinado #{User
  .where(first_name: "Usuario 2")
  .first.owner
  .where(blog: Blog.where(name: "Blog 4").first)
  .count}"

puts "Tarea 13. Hecha."

#Tarea 14: Establecer que el blog 5, pertenezca al ultimo usuario.

ow = Owner.new
ow.user = User.where(first_name: "Usuario 5").first
ow.blog = Blog.where(name: "Blog 5").first
ow.save

puts User.where(first_name: "Usuario 5").first.owner.count


puts User.where(first_name: "Usuario 5")
  .first.owner
  .where(blog: Blog.where(name: "Blog 5").first).count

puts "Tarea 14. Hecha."

#Tarea 15: Establecer que el tercer usuario sea propietario de todos los los Blogs.

1.upto(5) do |nblog|
  ow = Owner.new
  ow.user = User.where(first_name: "Usuario 3").first
  ow.blog = Blog.where(name: "Blog 1").first
  ow.save
end

puts User.where(first_name: "Usuario 3").first.owner.count

puts User.where(first_name: "Usuario 3").first.owner
  .where(blog: Blog
    .where(name: [
      "Blog 1", "Blog 2", "Blog 3", "Blog 4", "Blog 5"])).count

puts "Tarea 15. Hecha."

#Tarea 16 

#Haz que el primer usuario cree tres publicaciones para el blog con id = 2. 
#Recuerde que no debe hacer Publicacion.create(usuario: Usuario.first, blog_id: 2), sino algo como Publicacion.create(usuario: Usuario.first, blog: Blog.find(2)). 
#Repito, nunca se debe hacer referencia a las claves foráneas en Rails.

1.upto(3) do |npost|
  p = Post.new
  p.title = "Post #{npost}"
  p.content = "Contenido"
  p.blog = Blog.where(name: "Blog 2").first
  p.user = User.where(first_name: "Usuario 1").first
  p.save
end

ue = User.where(first_name: "Usuario 1").first
be = Blog.where(first_name: "Blog 2").first

puts "Posts: #{
  Post.where(user: ue, blog: be).count
}"

puts "Tarea 16. Hecha."


#Tarea 17
#Haz que el segundo usuario cree 5 publicaciones para el último blog.

us2 = User.where(first_name: "Usuario 2").first
ulb = Blog.where(name: "Blog 5").first

1.upto(5) do |npost|
  p = Post.new
  p.title = "Post #{npost}"
  p.content = "Contenido"
  p.user = us2
  p.blog = ulb   
  p.save
end

puts "Post: #{Post.where(blog: ulb, user: us2).count}"
puts "Tarea 17. Hecho"

#Tarea 18
us3 = User.where(first_name: "Usuario 3").first
Blog.all.each do |t|
  p = Post.new
  p.blog = t
  p.user = us3
  p.title = "Título"
  p.content = "Contenido"
  p.save
end

puts "#{Post.where(user: us3).count}"
puts "#{us3.post.count}"

puts "Tarea 18. Hecha"

#Tarea 19
# Haz que el tercer usuario cree 2 mensajes para la primera publicación creada y 3 mensajes para la segunda publicación creada.


primpub = Post.all[0]
secmpub = Post.all[1]

1.upto(2) do |t|
  m = Message.new
  m.post = primpub
  m.user = us3
  m.author = "Autor"
  m.message = "Mesaje"
  m.save
end

1.upto(3) do |t|
  m = Message.new
  m.post = secpub
  m.user = us3
  m.author = "Autor"
  m.message = "Mesaje"
  m.save
end
#Contar el número de mensajes del usuario 3 
#modelo has many
puts us3.message.count
#modelo belongs
puts  Message.where(user: us3).count

puts "Tarea 19. Hecha"

#Tarea 20 
# Haz que el cuarto usuario cree 3 mensajes para la última publicación que tu creaste.
us4 = User.where(first_name: "Usuario 4").first

1.upto(3) do |t|
  m = Message.new
  m.post = ulpub
  m.user = us4 
  m.author = "Algun autor"
  m.message = "Algun comentario"
  m.save
end

#contar los mensajes del usuario 4 
#has meny model 
puts us4.message.count
#belongs to 
puts Message.where(user: us:4).count
