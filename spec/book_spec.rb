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

  describe '#can_be_archived?' do
    context 'when the cover state is bad' do
      it 'returns true' do
        @book.cover_state = 'bad'
        expect(@book.can_be_archived?).to be true
      end
    end

    context 'when the cover state is good and the publish date is more than 10 years ago' do
      it 'returns true' do
        @book.publish_date = '2010-01-01'
        expect(@book.can_be_archived?).to be true
      end
    end

    context 'when the cover state is good and the publish date is within 10 years' do
      it 'returns false' do
        @book.publish_date = (Date.today - 5).to_s
        expect(@book.can_be_archived?).to be false
      end
    end
  end
end
