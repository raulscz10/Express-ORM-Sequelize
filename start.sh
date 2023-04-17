###########################################################

# crear base de datos
sequelize db:create

# crear modelo Nacionalidad
sequelize model:generate --name Nacionalidad --attributes 'nombre_nacion:string'

# crear modelo Direccion
sequelize model:generate --name Direccion --attributes 'calle:string,numero:integer'

# crear modelo Categoria
sequelize model:generate --name Categoria --attributes 'nombre_categoria:string'

# crear modelo Alumno
sequelize model:generate --name Alumno --attributes 'nombre:string,apellidos:string,edad:integer,fecha_nacimiento:date,activo:enum:{si,no},id_nacionalidad:integer,id_direccion:integer'

# crear modelo Curso
sequelize model:generate --name Curso --attributes 'nombre_curso:string,id_categoria:integer'

###########################################################

# ejecutar migracion
sequelize db:migrate 
sequelize db:migrate  --to 03-create-alumno.js

# revertir la migracion
sequelize db:migrate:undo
sequelize db:migrate:undo:all
sequelize db:migrate:undo:all --to 03-create-alumno.js

# crear seed
sequelize seed:generate --name seed-nacionalidad
sequelize seed:generate --name seed-direccion
sequelize seed:generate --name seed-alumno

# ejecutar seed
sequelize db:seed:all
sequelize db:seed --seed 02-seed-alumno.js

# revertir seed
sequelize db:seed:undo
sequelize db:seed:undo:all
sequelize db:seed:undo --seed 03-seed-alumno.js