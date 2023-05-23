require 'json'
require 'simpletable'

class TestObject
  attr_reader :a, :b, :c
  def initialize(a,b,c)
    @a = a
    @b = b
    @c = c
  end
end

def lambda_handler(event:, context:)
    # TODO implement

    objs = []
    objs << TestObject.new("A1", "B1", "C1")
    objs << TestObject.new("A2", "B2", "C2")
    objs << TestObject.new("A3", "B3", "C3")
    objs << TestObject.new("A4", "B4", "C4")

    titles = ["ColA", "ColB", "ColC"]
    methods = [:a, :b, :c]

    t = SimpleTable.new

    tstr = t.from_objects(objs, titles, methods).text

    { statusCode: 200, body: tstr }
end

