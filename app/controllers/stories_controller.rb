class StoriesController < ApplicationController
  def index
    @stories = Story.all
    render json: @stories
  end

  def show
    @story = Story.find(params[:id])
    render json: @story, include: [:photos]
  end

  def create
    stories_params = params.require(:story).permit(:title, :desc)
    photos_params = params.require(:story).permit({ photos: [] })
    @story = Story.create(stories_params)
    if photos_params[:photos]
      photos_params[:photos].each do |a|
        @photo = @story.photos.create!(:photo => a)
      end
    end
    redirect_to admin_stories_path
  end
end
