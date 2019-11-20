require_relative('../db/sql_runner')
require_relative('album')

class Artist

attr_accessor :name
attr_reader :id

  def initialize(details)
    @id = details['id'] if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i()
  end

  def self.delete_all()
    sql = "DElETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.view_all()
    sql = "SELECT * from artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artist.new(artist)}
  end

  def view_albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    return albums.map{|album| Album.new(album)}
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artist WHERE id = $1 "
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_artist(artist_name)
    sql = "SELECT * FROM artists WHERE name = $1"
    values = [artist_name]
    result = SqlRunner.run(sql, values)[0]
    return Artist.new(result)
  end




end
