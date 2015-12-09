def newsarticle_attributes(overrides = {})
  {
    date: "12 June 2015",
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

def member_attributes(overrides = {})
  {
    name: "Piet Bracke",
    title: "Professor",
    email: "piet.bracke@ugent.be",
    phone: "32 (0)9 264 68 64",
    address: "Department of Sociology Korte Meer 5, 9000 Ghent (Belgium)",
    bio: "Piet Bracke is a full professor at the Department of Sociology at Ghent University",
    bibliography: "https://biblio.ugent.be/publication?q=%22sarah+van+leuven%22"
  }.merge(overrides)
end

def theme_attributes(overrides = {})
  {
    title: "Stakeholder analysis",
    summary: "this is the summary",
    description: "this research line aims to chart the organizations that are active in the broad field of health issues in Flanders"
  }
end

def publication_attributes(overrides = {})
  {
    date: "12 June 2015".to_date,
    title: "Ouder worden in een veranderende samenleving",
    description: "book review"
  }.merge(overrides)
end
