require('minitest/autorun')
require('minitest/reporters')
require_relative('../models/artist')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ArtistTest < MiniTest::Test

  def test_can_create_new_artist
    artist_details = {
      'name' => 'Paramore',
    }

    artist1 = Artist.new(artist_details)
    assert_equal('Paramore', artist1.name)
  end

end
