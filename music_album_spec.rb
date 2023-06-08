require 'rspec'
require_relative 'music_album'

describe MusicAlbum do
  let(:album_title) { 'Santosh' }
  let(:publish_date) { '2023-04-02' }
  let(:on_spotify) { false }
  let(:music_album) { described_class.new(album_title, publish_date, on_spotify: on_spotify) }

  describe '#initialize' do
    it 'initializes a new MusicAlbum object with the given parameters' do
      expect(music_album).to be_a(MusicAlbum)
      expect(music_album.title).to eq(album_title)
      expect(music_album.on_spotify).to eq(on_spotify)
    end
  end

  describe '#can_be_archived?' do
    context 'when the album is not on Spotify' do
      it 'returns false' do
        expect(music_album.can_be_archived?).to be false
      end
    end
  end
end
