class ThingsController < ApplicationController
  before_action :set_thing, only: %i[ show edit update destroy ]

  # GET /things or /things.json
  def index
    @things = Thing.all
  end

  # GET /things/1 or /things/1.json
  def show
  end

  # GET /things/new
  def new
    @thing = Thing.new
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things or /things.json
  def create
    @thing = Thing.new(thing_params)

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: "Thing was successfully created." }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @thing.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /things/1 or /things/1.json
  def update
    respond_to do |format|
      if @thing.update(thing_params)
        format.html { redirect_to @thing, notice: "Thing was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @thing.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /things/1 or /things/1.json
  def destroy
    @thing.destroy!

    respond_to do |format|
      format.html { redirect_to things_path, notice: "Thing was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def thing_params
      params.expect(thing: [ :name, :color, :grade ])
    end
end
