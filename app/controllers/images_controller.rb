class ImagesController < ApplicationController
   def first_image
    @image_first = Image.first.url
  end
end
