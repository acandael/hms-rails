def newsarticle_attributes(overrides = {})
  {
    title: "article1",
    body: "this is the bodytext",
    image: "someimage.jpg",
    link: "http://www.deredactie.be",
  }.merge(overrides)
end
