
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
#Repito, nunca se debe hacer referencia a las claves for??neas en Rails.

1.upto(3) do |npost|
  p = Post.new
  p.title = "Post #{npost}"
  p.content = "Contenido"
  p.blog = Blog.where(name: "Blog 2").first
  p.user = User.where(first_name: "Usuario 1").first
  p.save
end

ue = User.where(first_name: "Usuario 1").first
be = Blog.where(name: "Blog 2").first

puts "Posts: #{
  Post.where(user: ue, blog: be).count
}"

puts "Tarea 16. Hecha."


#Tarea 17
#Haz que el segundo usuario cree 5 publicaciones para el ??ltimo blog.

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
  p.title = "T??tulo"
  p.content = "Contenido"
  p.save
end

puts "#{Post.where(user: us3).count}"
puts "#{us3.post.count}"

puts "Tarea 18. Hecha"

#Tarea 19
# Haz que el tercer usuario cree 2 mensajes para la primera publicaci??n creada y 3 mensajes para la segunda publicaci??n creada.


primpub = Post.all[0]
secpub = Post.all[1]

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
#Contar el n??mero de mensajes del usuario 3 
#modelo has many
puts us3.message.count
#modelo belongs
puts  Message.where(user: us3).count

puts "Tarea 19. Hecha"

#Tarea 20 
# Haz que el cuarto usuario cree 3 mensajes para la ??ltima publicaci??n que tu creaste.
us4 = User.where(first_name: "Usuario 4").first
ulpub = Post.all.last

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
puts Message.where(user: us4).count

#Tarea 21 
# Cambie el propietario de la 2 publicaci??n para que sea el ??ltimo usuario.

po2 = Post.all[1]
#Captura al ??ltimo usuario en la variable  ulu
ulu = User.all.last
#actualizar usuario 
po2.user = ulu
po2.save
puts "Despues => #{po2.user.first_name}"
puts "Tarea 21. Hecha"

#Tarea 22 
#Cambie el contenido de la segunda publicaci??n por algo diferente.

po2 = Post.all[1]
po2.content = "Un nuevo contenido modificado."
po2.save
puts po2.errors.full_messages
puts "content: #{po2.content}"
puts "Tarea 22. Hecha"

#Tarea 23 
#Obtenga todos los blog que son propiedad del tercer usuario (haz que esto funcione con un simple Usuario.find(3).blogs).

us3= User.find(3)
owners = us3.owner
blog_ids = owners.pluck(:blog_id) # => [45, 3, 23]
blogs = Blog.where(id: blog_ids)
puts "Blogs del usuario 3: #{blogs}"
puts "Tarea 23. Hecha"

#Tarea 24 
#Obtenga todas las publicaciones que fueron creadas por el tercer usuario.
#Tarea 24
us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first

puts us3.post #has_many
puts Post.where(user: us3) #belongs_to
puts "Tarea 24. Hecho."

#Tarea 25 
#Obtenga todos los mensajes escritos por el tercer usuario.
us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first

puts us3.message
puts "Tarea 25. Hecha"

# tarea 26  
#obtenga todas las publicaciones asociadas al blog con id = 5 y qui??n dej?? cada publicaci??n.

bl5 = Blog.find(5)
posts = Post.where(blog: bl5)
users = posts.pluck(:user_id)
puts User.where(id: users)
puts " Los blogs con id5 son: #{posts.count}"
puts "Tarea 26 hecha"

#tarea 27   
#Obtenga todos los mensajes asociados al blog con id = 5, junto con toda la informaci??n de los usuarios que dejaron mensajes.

bl5 = Blog.find(5)
posts = Post.where(blog: bl5)
msgs = Message.where(post: posts)
users = msgs.pluck(:user_id)

puts User.where(id: users)

puts "Los mensajes asociados al Blog 5 son: #{msgs.count}"

puts "Tarea 27 hecha"

# tarea 28   
#Obtenga toda la informaci??n de los usuarios que son propietarios del primer blog (haz que esto funcione con un simple Blog.first.propietarios).

owners = Blog.first.owner
users = owners.pluck(:user_id)
User.where(id: users).each do |t|
  puts "#{t.first_name} #{t.last_name} #{t.email_address}"
end

puts "tarea 28 hecha"

#tarea 29   
#C??mbielo, es decir, el primer usuario ya no es propietario del primer blog.

us1 = User.first
usul = User.last
bl1 = Blog.first
own = Owner.where(user: us1, blog: bl1)


own.update_all(user_id: usul.id)

puts Owner.where(user: us1, blog: bl1).count

puts "tarea 29 hecha"
