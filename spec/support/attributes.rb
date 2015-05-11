def newsarticle_attributes(overrides = {})
  {
    title: "article1",
    body: "this is the bodytext",
    image: "someimage.jpg",
    link: "http://www.deredactie.be",
  }.merge(overrides)
end
 
def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end
