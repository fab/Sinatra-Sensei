post1 = Post.create(title: 'This is my first post!', 
                    body: 'Hello world. This is my blog! My first post is a short one.',
                    user_id: 1)

post2 = Post.create(title: 'What about rails?', 
                    body: 'Yeah, what about it.',
                    user_id: 2)

post3 = Post.create(title: 'Building web apps is fun',
                    body: 'This is awesome',
                    user_id: 2)

post4 = Post.create(title: 'Blogging real good',
                    body: 'Really good',
                    user_id: 2)

user1 = User.create(first_name: 'Fab', last_name: 'Mackojc', 
                    email: 'fab@gmail.com', password: 'hello')

user2 = User.create(first_name: 'Frank', last_name: 'Lampard', 
                    email: 'frank@gmail.com', password: 'howdy')

tag1 = Tag.create(name: 'personal')
tag2 = Tag.create(name: 'rails')
tag3 = Tag.create(name: 'sinatra')

comment1 = Comment.create(content: 'This is my first comment!', user_id: 1, post_id: 1)

post1.tags << tag1

post2.tags << tag2
post2.tags << tag3

post3.tags << tag3

post4.tags << tag3
