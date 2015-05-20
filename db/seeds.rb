# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 
NewsArticle.create!([
  {
    title: 'De mazen van het internet',
    body: 
    %{
      Hoe veilig gedragen we ons op het web? En zijn we ons bewust van de risico’s       die we lopen?
    }.squish,
    link: 'http://www.cepec.ugent.be'
  },
  {
    title: 'Ello, social netwerken zonder reclame',
    body:
    %{
      Er heerst heel wat buzz op het Internet.. There is a new player in social med      ia!
    }.squish,
    link: 'http://www.cjs.ugent.be'
  },
  {
    title: 'Product placement heruitgevonden?',
    body:
    %{
      De muziekgigant Universal Music Group heeft bekend gemaakt dat ze voortaan, m      et behulp van technologie van het Britse bedrijf Mirriad, nieuwe reclame in r      eeds bestaande videoclips kan smokkelen
    }.squish,
    link: 'http://www.cjs.ugent.be'
  }
])
 
Member.create!([
  {
    name: 'Piet Bracke',
    title: 'Professor',
    email: 'piet.bracke@ugent.be',
    phone: '09 264 91 89',
    address: %{Vakgroep Communicatiewetenschappen Korte Meer 11,                                     9000 Gent}.squish,
    bio: %{Piet Bracke is a full professor at the Department of Sociology at Ghent University.}.squish
  },
  {
    name: 'Sarah Van Leuven',
    title: 'Postdoctoral Researcher',
    email: 'sarah.vanleuven@ugent.be',
    phone: '32 9 264 67 98',
    address: %{Department of Media Studies, 9000 Gent}.squish,
    bio: %{Sarah Van Leuven is the postdoctoral research coordinator of Health, Media & Society. She is also a member of the Center for Journalism Studies (CJS).}.squish
  },
  {
    name: 'Geert Jacobs',
    title: 'Professor',
    email: 'geer.jacobs@ugent.be',
    phone: '32 9 264 34 56',
    address: %{Departement of Marketing, 3000 Leuven}.squish,
    bio: %{
Geert Jacobs received a PhD in Linguistics in 1997 from the University of Antwerp, where he wrote a dissertation on the metapragmatics of press releases.}.squish
  }
])

Theme.create!([
  {
    title: 'Stakeholder analysis',
    description: 'This research line aims to chart the organizations that are active in the broad field of health issues in Flanders'
  },
  {
    title: 'News story lifecycle analysis',
    description: 'The second line of research focuses on the (production) lifecycle of news stories on health issues as they travel back and forth among the stakeholders'
  },
  {
    title: 'News sourcing, frame and discourse analysis',
    description: 'This research line focuses on the final news content by monitoring how a wide range of Flemish news media cover health-related information.'
  },
  {
    title: 'Audience Research',
    description: 'The audience-oriented research line is to be situated at the receiver’s end of the health discourse chain.'
  }
])
