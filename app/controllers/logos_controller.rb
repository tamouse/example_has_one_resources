# frozen_string_literal: true

## LogosController
#
# handles actions for dealing with singular logo resource on company
class LogosController < ApplicationController
  before_action :set_company
  before_action :set_logo, only: [:show, :edit, :update, :destroy]

  # GET /logos
  # GET /logos.json
  def index
    @logos = Logo.all
  end

  # GET /logos/1
  # GET /logos/1.json
  def show; end

  # GET /logos/new
  def new
    @logo = Logo.new
  end

  # GET /logos/1/edit
  def edit; end

  # POST /logos
  # POST /logos.json
  def create
    @logo = Logo.new(logo_params)

    respond_to do |format|
      if @logo.save
        format.html { redirect_to @logo, notice: 'Logo was successfully created.' }
        format.json { render :show, status: :created, location: @logo }
      else
        format.html { render :new, alert: 'Error creating logo' }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logos/1
  # PATCH/PUT /logos/1.json
  def update
    respond_to do |format|
      if @logo.update(logo_params)
        format.html { redirect_to @logo, notice: 'Logo was successfully updated.' }
        format.json { render :show, status: :ok, location: @logo }
      else
        format.html { render :edit, alert: 'Error updating logo' }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logos/1
  # DELETE /logos/1.json
  def destroy
    @logo.destroy
    respond_to do |format|
      format.html { redirect_to logos_url, notice: 'Logo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_company
    @company = Company.find(params[:company])
  end

  # NOTE: The normal way of retrieving the logo record does not work, since we set it up
  # as a singular resource under companies. Instead let's retrieve both the @company as
  # well as it's @logo:
  def set_logo
    @logo = Logo.find(@company.logo_id) # NOTE: this raises a 404 if there's no logo,
                                        # which is what we want here.
  end

  # Only allow a list of trusted parameters through.
  def logo_params
    params.require(:logo).permit(:name, :belongs_to)
  end
end
