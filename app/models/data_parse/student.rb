class DataParse::Student
  attr_reader :name, :id

  def initialize(student_raw)
    @name = student_raw[:name]
    @id = student_raw[:id]
  end
end
