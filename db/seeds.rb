post1 = Post.create(title: 'This is my first post!', 
                    body: 'Hello world. This is my blog! My first post is a short one.')

user1 = User.create(first_name: 'Fab', last_name: 'Mackojc', 
                    email: 'fab@gmail.com', password: 'hello')

tag1 = Tag.create(name: 'personal')

comment1 = Comment.create(content: 'This is my first comment!')
