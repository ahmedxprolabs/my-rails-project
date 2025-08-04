#model generation command

#rails generate model Post title:string content:text

#rails db:migrate

#add column: 
#add_column :users, :age, :integer 

#add_foreign_key
#add_foreign_key :products, :users

#add index
#add_index :users, :email

#add reference
#add_reference :products, :user, foreign_key: true

#create join table
#create_join_table :students, :courses

#drop join table
#drop_join_table :students, :courses

#remove column
#remove_column :users, :age, :integer

#remove foreign key
#remove_foreign_key :products, :users

#rename column
#rename_column :users, :username, :login

#rename table
#rename_column :users, :username, :login
