class EwosController < ApplicationController
  respond_to :json
  before_action :set_ewo, only: [:show, :edit, :update, :destroy]
  
  # GET /ewos
  # GET /ewos.json
  def index
    @ewos = Ewo.all
	 respond_with @ewos
  end

  # GET /ewos/1
  # GET /ewos/1.json
  def show
  end

  # GET /ewos/new
  def new
    @ewo = Ewo.new
  end

  # GET /ewos/1/edit
  def edit
  end

  # POST /ewos
  # POST /ewos.json
  def create
    @ewo = Ewo.new(ewo_params)

    respond_to do |format|
      if @ewo.save
        format.html { redirect_to @ewo, notice: 'Ewo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ewo }
      else
        format.html { render action: 'new' }
        format.json { render json: @ewo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ewos/1
  # PATCH/PUT /ewos/1.json
  def update
    respond_to do |format|
      if @ewo.update(ewo_params)
        format.html { redirect_to @ewo, notice: 'Ewo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ewo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ewos/1
  # DELETE /ewos/1.json
  def destroy
    @ewo.destroy
    respond_to do |format|
      format.html { redirect_to ewos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ewo
      @ewo = Ewo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ewo_params
      params[:ewo]
    end
end
