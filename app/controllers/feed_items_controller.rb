class FeedItemsController < ApplicationController
  before_action :get_user
  before_action :set_feed_item, only: %i[ show edit update destroy ]

  # GET /feed_items or /feed_items.json
  def index
    @feed_items = FeedItem.all
  end

  # GET /feed_items/1 or /feed_items/1.json
  def show
  end

  # GET /feed_items/new
  def new
    @feed_item = @user.feed_items.build
  end

  # GET /feed_items/1/edit
  def edit
  end

  # POST /feed_items or /feed_items.json
  def create
    @feed_item = @user.feed_items.build(feed_item_params)

    respond_to do |format|
      if @feed_item.save
        format.html { redirect_to user_feed_items_path(@user), notice: "Feed item was successfully created." }
        format.json { render :show, status: :created, location: @feed_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feed_items/1 or /feed_items/1.json
  def update
    respond_to do |format|
      if @feed_item.update(feed_item_params)
        format.html { redirect_to user_feed_items_path(@user), notice: "Feed item was successfully updated." }
        format.json { render :show, status: :ok, location: @feed_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @feed_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_items/1 or /feed_items/1.json
  def destroy
    @feed_item.destroy!
      
    respond_to do |format|
      format.html { redirect_to user_feed_items_path(@user) , status: :see_other, notice: "Feed item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_user
      @user = User.find(params[:user_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_feed_item
      @feed_item = @user.feed_items.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def feed_item_params
      params.require(:feed_item).permit(:body, :likes, :user_id)
    end
end
