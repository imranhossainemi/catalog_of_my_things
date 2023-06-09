require_relative '../item'

describe Item do
  let(:item) { Item.new }

  describe '#initialize' do
    it 'creates a new item with default attributes' do
      expect(item.id).to be_a(Integer)
      expect(item.genre).to be_nil
      expect(item.author).to be_nil
      expect(item.source).to be_nil
      expect(item.label).to be_nil
      expect(item.publish_date).to be_nil
      expect(item.archived).to be_falsey
    end
  end

  describe '#move_to_archive' do
    context 'when the item can be archived' do
      it 'marks the item as archived' do
        item.instance_variable_set(:@publish_date, '2010/01/11')

        item.move_to_archive

        expect(item.archived).to be_truthy
      end
    end

    context 'when the item cannot be archived' do
      it 'does not mark the item as archived' do
        item.instance_variable_set(:@publish_date, '2022/01/11')

        item.move_to_archive

        expect(item.archived).to be_falsey
      end
    end
  end
end
