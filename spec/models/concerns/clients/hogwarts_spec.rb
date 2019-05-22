require 'rails_helper'

describe Clients::Hogwarts do
  it 'connects to database correctly' do
    query = '1'

    facade = SearchResultsFacade.new(query)

    query = facade.get_json(query) # module method to test

    # Integrate VCR for this type of testing in normal circumstances
    expect(query.count).to eq(29)
    expect(query[0][:id]).to eq(1)
    expect(query[0][:name]).to eq('Albus Dumbledore')
  end
end
