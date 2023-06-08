class MusicAlbum < Item
  attr_accessor :on_spotify, :title

  def initialize(album_title, publish_date, on_spotify: false, id: rand(1..10_000))
    @on_spotify = on_spotify
    @title = album_title
    super(id)
    @publish_date = publish_date
  end

  def can_be_archived?
    @on_spotify == true && super
  end
end
