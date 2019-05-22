class SearchResultsFacade
  include Clients::Hogwarts

  attr_reader :query

  def initialize(query)
    @query = query_converter(query)
  end

  def student_count
    "#{results.count} Students"
  end

  def house_results
    results.map do |student_raw|
      DataParse::Student.new(student_raw)
    end
  end

  private

    def results
      @_results ||= get_json(query)
    end

    def query_converter(query)
      houses = {
                'griffyndor' => '1',
                'ravenclaw' => '2',
                'hufflepuff' => '3',
                'slytherin' => '4'
                }
      houses[query]
    end
end
