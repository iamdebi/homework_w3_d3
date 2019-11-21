require_relative('../db/sql_runner')
require_relative('artist')

class Album

attr_accessor :title, :genre
attr_reader :id, :artist_id

  def initialize(details)
    @id = details['id'].to_i() if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DElETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.view_all()
    sql = "SELECT * from albums;"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def view_artist()
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [@artist_id]
    artist = SqlRunner.run(sql, values)[0]
    return Artist.new(artist)
  end

  def update()
    sql = "UPDATE albums SET (title, genre)  = ($1, $2) WHERE id = $3;"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DElETE FROM albums WHERE id = $1 "
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_album(album_name)
    sql = "SELECT * FROM albums WHERE title = $1"
    values = [album_name]
    result = SqlRunner.run(sql, values)[0]
    return Album.new(result)
  end

  def self.delete_album_by_id(id)
    sql = "DElETE FROM albums WHERE id = $1 "
    values = [id]
    SqlRunner.run(sql, values)
  end

end
