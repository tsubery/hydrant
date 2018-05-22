require 'test_helper'

class DogTest < ActiveSupport::TestCase
  test "attach 1000 photos" do
    dog_photo = StringIO.new(File.read("test/dog.jpg"))
    rover = Dog.create!(name: "Rover", owner: "owner")

    (1..200).each do |i|
      print '.' if (i % 20).zero?

      rover.photos.attach(
        io: dog_photo.tap(&:rewind),
        filename: "#{i}.jpg",
        content_type: "image/jpg"
      )
    end
  end
end
