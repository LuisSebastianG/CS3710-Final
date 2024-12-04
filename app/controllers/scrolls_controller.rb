class ScrollsController < ApplicationController
  before_action :set_scroll, only: %i[show edit update destroy]
  
  def index
    @scrolls = FeedItem.all
#    if user_signed_in?
#      @scrolls = current_user.personalized_feed_items
#    else
#      @scrolls = FeedItem.all
#    end
  end

  def show
  end

  def new
    @scroll = Scroll.new
  end

  def edit
  end

  def create
    @scroll = Scroll.new(scroll_params)
    if @scroll.save
      redirect_to @scroll, notice: 'Scroll was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @scroll.update(scroll_params)
      redirect_to @scroll, notice: 'Scroll was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @scroll.destroy
    redirect_to scrolls_url, notice: 'Scroll was successfully destroyed.'
  end

  private

  def set_scroll
    @scroll = Scroll.find(params[:id])
  end

  def scroll_params
    params.require(:scroll).permit(:user_id, :feed_item_id)
  end
end