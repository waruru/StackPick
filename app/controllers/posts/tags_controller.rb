class Posts::TagsController < ApplicationController
  before_action :set_posts_tag, only: %i[ show edit update destroy ]

  # GET /posts/tags or /posts/tags.json
  def index
    @posts_tags = Tag.all
  end

  # GET /posts/tags/1 or /posts/tags/1.json
  def show
  end

  # GET /posts/tags/new
  def new
    @posts_tag = Tag.new
  end

  # GET /posts/tags/1/edit
  def edit
  end

  # POST /posts/tags or /posts/tags.json
  def create
    @posts_tag = Tag.new(posts_tag_params)

    respond_to do |format|
      if @posts_tag.save
        format.html { redirect_to posts_tag_url(@posts_tag), notice: "Tag was successfully created." }
        format.json { render :show, status: :created, location: @posts_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @posts_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/tags/1 or /posts/tags/1.json
  def update
    respond_to do |format|
      if @posts_tag.update(posts_tag_params)
        format.html { redirect_to posts_tag_url(@posts_tag), notice: "Tag was successfully updated." }
        format.json { render :show, status: :ok, location: @posts_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @posts_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/tags/1 or /posts/tags/1.json
  def destroy
    @posts_tag.destroy

    respond_to do |format|
      format.html { redirect_to posts_tags_url, notice: "Tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_posts_tag
      @posts_tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def posts_tag_params
      params.fetch(:posts_tag, {})
    end
end
