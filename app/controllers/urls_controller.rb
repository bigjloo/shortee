class UrlsController < ApplicationController
  def new
    # byebug
    @url = Url.new(url_params)
    shortee = SecureRandom.hex(6)
    @url.short = "http://localhost:3000/#{shortee}"
    # byebug
    # respond_to do |format|
    #   if @url.save
    #     format.html { redirect_to urls_show_path, notice: 'Shortee was successfully created.' }
    #     format.json { render :show, status: :created, location: @url }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @url.errors, status: :unprocessable_entity }
    #   end
    # end
    if @url.save
      # byebug
      # redirect_to action: "show", id: @url.id
      render "/urls/show"
    end
  end

  def edit
  end

  def show
  end

  def delete
  end

  def update
  end

  def index
  end

  def destroy
  end

  def short
    @url = Url.find_by_short(params)
  end

  private

  def url_params
    params.require(:url).permit(:long)
  end

  def generate_short_url
    self.short = SecureRandom.hex(6)
  end

end
