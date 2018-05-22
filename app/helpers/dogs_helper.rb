module DogsHelper
  def profile_photo(dog)
    if dog.profile.attachment
      image_tag(url_for(dog.profile), width: 200)
    else
      image_tag  "dog_icon.jpg", width: 200
    end
  end
end
