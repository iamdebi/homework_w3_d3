require('pry')
require_relative('models/album')
require_relative('models/artist')
Album.delete_all()
Artist.delete_all()


artist1 = Artist.new(
  {
    'name' => 'Paramore'
  }
)
artist1.save()

artist2 = Artist.new(
  {
    'name' => 'Love, Robot'
  }
)
artist2.save()

album1 = Album.new(
  'title' => 'After Laughter',
  'genre' => 'pop',
  'artist_id' => artist1.id
)
album1.save()

album2 = Album.new(
  'title' => 'All We Know Is Fallen',
  'genre' => 'pop/rock',
  'artist_id' => artist1.id
)
album2.save()

album3 = Album.new(
  'title' => 'B.A.D',
  'genre' => 'pop/rock',
  'artist_id' => artist2.id
)
album3.save()

binding.pry

nil
