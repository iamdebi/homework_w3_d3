require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/album')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class AlbumTest < MiniTest::Test

  def test_can_create_new_album
    album_details = {
      'title' => 'After Laughter',
      'genre' => 'pop'
    }

    album_test = Album.new(album_details)
    assert_equal('After Laughter', album_test.title)
  end

end
