class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  # GET /ratings
  # GET /ratings.json
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
  end

  # GET /ratings/new
  def new
    @rating = Rating.new
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(params[:id])
      @idea = Idea.find(params[:idea_id])
end

  # POST /ratings
  # POST /ratings.json
  def create
    @idea = Idea.find(params[:idea_id])
    @rating = Rating.new rating_params
       @rating.idea = @idea
       @rating.user  = current_user
       if @rating.save
     redirect_to idea_path(@idea)
    else
      render 'ideas/show'
    end
    # respond_to do |format|
    #   if @rating.save
    #     format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
    #     format.json { render :show, status: :created, location: @rating }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @rating.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /ratings/1
  # PATCH/PUT /ratings/1.json
  # def update
  #   respond_to do |format|
  #     if @rating.update(rating_params)
  #       format.html { redirect_to idea_path, notice: 'Rating was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @idea }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @rating.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  def update
    @rating = Rating.find(params[:id])
    @idea  = Idea.find(params[:idea_id])
      if @rating.update rating_params
        redirect_to idea_path(@idea)
      else
        redirect_to root_path(@idea, @rating)
      end
    end



  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating = Rating.find(params[:id])
    @idea = Idea.find(params[:idea_id])
     if @rating.destroy
      redirect_to idea_path(@idea)
     end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:body)
    end
end
