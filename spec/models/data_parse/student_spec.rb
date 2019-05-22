require 'rails_helper'

describe DataParse::Student do
  it 'returns attr correctly' do
    student_raw = {
               :id=>52,
               :name=>"Gormlaith Gaunt",
               :house_id=>4,
               :created_at=>"2019-03-30T17:47:41.195Z",
               :updated_at=>"2019-03-30T17:47:41.195Z"
              }

    student = DataParse::Student.new(student_raw)

    expect(student.name).to eq("Gormlaith Gaunt")
    expect(student.id).to eq(52)
  end
end
