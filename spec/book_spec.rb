require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('2023-05-24', 'publisher', 'coverstate')
  end

  it 'checking Book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'checking attributes' do
    expect(@book.publish_date).to eq('2023-05-24')
  end

  it 'checking for book publisher' do
    expect(@book.publisher).to eq('publisher')
  end

  it 'checking for book coverstate' do
    expect(@book.cover_state).to eq('coverstate')
  end
end
