module DogsHelper
  def profile_photo(dog)
    if dog.profile.attachment
      image_tag(dog.profile.variant(resize: "400x400"))
    else
      image_tag  "dog_icon.jpg", width: 100, height: 100
    end
  end
end
