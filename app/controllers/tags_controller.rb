class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show edit update destroy ]

  # GET /tags or /tags.json
  def index
    tags = Tag.joins(:post_tags).group(:name).select('tags.*','count(name) as post_count')
    @tags = tags.sort{|a, b| b.post_count <=> a.post_count}
  end

  # GET /tags/1 or /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags or /tags.json
  def create
    tag = Tag.exists?(tag_params) ? Tag.find_by(tag_params) : Tag.new(tag_params)

    if !tag.new_record? or tag.save
      @tag = Tag.new
      render turbo_stream: [
        turbo_stream.append("tags", partial: "posts/tags/form_tag", locals: {tag: tag}),
        turbo_stream.replace("new_tag", template: "tags/new", locals: { tag: @tag })
      ]
    else
      format.html { render :new, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /tags/1 or /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tag_url(@tag), notice: "Tag was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1 or /tags/1.json
  def destroy
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to tags_url, notice: "Tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
