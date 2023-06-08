require_relative '../label'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
  end

  it 'checking Label instance' do
    expect(@label).to be_instance_of Label
  end

  it 'checking for label title' do
    expect(@label.title).to eq('title')
  end

  it 'checking for label color' do
    expect(@label.color).to eq('color')
  end
end
