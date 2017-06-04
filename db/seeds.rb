# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contact.create(name: 'Camila dos Santos', email: 'cdossantos@yahoo.com.br', age: 22, state: "Bahia", job: "Auxiliar de Limpeza")
Contact.create(name: 'Camila Medeiros', email: 'camila@meuprovedor.com.br', age: 29, state: "Rio de Janeiro", job: "Advogada")
Contact.create(name: 'Daniela Berdinazzi', email: 'daniberdinazzi@gmail.com', age: 36, state: "Rio Grande do Sul", job: "Secretária")
Contact.create(name: 'Erenilton Silveira', email: 'oere@bol.com.br', age: 51, state: "Minas Gerais", job: "Bancário")
Contact.create(name: 'Everaldo Costa', email: 'evy@gmail.com', age: 35, state: "Rio de Janeiro", job: "Jornalista")
Contact.create(name: 'Felipe Hespanhol', email: 'felipeghespanhol@gmail.com', age: 32, state: "Rio de Janeiro", job: "Desenvolvedor de Software")
Contact.create(name: 'Gabriela Jordão', email: 'gabijordan@gmail.com', age: 27, state: "Rio de Janeiro", job: "Arquivologista")
Contact.create(name: 'Henrique Vecchio', email: 'hvecchio@gmail.com', age: 25, state: "São Paulo", job: "Estudante")
Contact.create(name: 'João Batista', email: 'jbatista@providerx.com.br', age: 29, state: "Paraíba", job: "Camionista")
Contact.create(name: 'Leandro Carvalho', email: 'lele@carvalhos.com', age: 50, state: "Espírito Santo", job: "Empresário")
Contact.create(name: 'Lívia Pedreira', email: 'livia@gmail.com', age: 15, state: "Rio de Janeiro", job: "Estudante")
Contact.create(name: 'Lucas dos Santos', email: 'luquinha@gmail.com', age: 28, state: "Pará", job: "Vaqueiro")
Contact.create(name: 'Milton Nascimento', email: 'miltinho@mara.com.br', age: 74, state: "Minas Gerais", job: "Cantor")
Contact.create(name: 'Monaliza Matarazzo', email: 'mona@mtz.com.br', age: 35, state: "São Paulo", job: "Administrador")
Contact.create(name: 'Orcar Wilde', email: 'oscarw@gmail.com', age: 96, state: "Mato Grosso do Sul", job: "Escritor")
Contact.create(name: 'Oswaldo Montebranco', email: 'waldo@gmail.com', age: 64, state: "Paraná", job: "Empresário")
Contact.create(name: 'Priscila Oliveira', email: 'prioliva@yahoo.com.br', age: 22, state: "Rio de Janeiro", job: "Advogada")
Contact.create(name: 'Reinaldo Jamelão', email: 'reinaldo@yahoo.com.br', age: 47, state: "Rio de Janeiro", job: "Cantor")
Contact.create(name: 'Wendelson Cruzes', email: 'wendy@gmail.com', age: 18, state: "São Paulo", job: "Estudante")
Contact.create(name: 'Willian Machado', email: 'willian@machado.com', age: 66, state: "Goiás", job: "Professor")
Contact.create(name: 'Uhtred Ragnarson', email: 'uhtred@thelastkingdom.com', age: 34, state: "Rio de Janeiro", job: "Empresário")

Segment.create(name: "São Paulo", conditions_attributes: [ { field: 'state', name: 'eq', term: 'São Paulo' } ])
Segment.create(name: "Rio de Janeiro", conditions_attributes: [ { field: 'state', name: 'eq', term: 'Rio de Janeiro' } ])
Segment.create(name: '.com', conditions_attributes: [ { field: 'email', name: 'end', term: '.com' } ])
Segment.create(name: '.com.br', conditions_attributes: [ { field: 'email', name: 'end', term: '.com.br' } ])
Segment.create(name: 'Estudantes', conditions_attributes: [ { field: 'job', name: 'start', term: 'Estudante' } ])
