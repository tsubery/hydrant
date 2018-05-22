class Dog < ApplicationRecord
  has_one_attached :profile
  has_many_attached :photos
end
