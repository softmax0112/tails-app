class Api::V1::Admin::DatabasesController < ApplicationController
  before_action :set_admin_database, only: %i[ show update destroy ]

  # GET /api/v1/admin/databases
  def index
    @admin_databases = Admin::Database.all

    render json: @admin_databases
  end

  # GET /api/v1/admin/databases/1
  def show
    render json: @admin_database
  end

  # POST /api/v1/admin/databases
  def create
    @admin_database = Admin::Database.new(admin_database_params)

    if @admin_database.save
      render json: @admin_database, status: :created, location: api_v1_admin_database_url(@admin_database)
    else
      render json: @admin_database.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/admin/databases/1
  def update
    if @admin_database.update(admin_database_params)
      render json: @admin_database
    else
      render json: @admin_database.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/admin/databases/1
  def destroy
    @admin_database.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_database
      @admin_database = Admin::Database.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_database_params
      params.require(:api_v1_admin_database).permit(:name, :hostname, :username, :password, :password_confirmation, :port, :schema)
    end
end
