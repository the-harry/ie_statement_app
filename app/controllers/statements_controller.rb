# frozen_string_literal: true

class StatementsController < ApplicationController
  before_action :set_statement, only: %i[show edit update destroy]

  # GET /statements or /statements.json
  def index
    @statements = Statement.all
  end

  # GET /statements/1 or /statements/1.json
  def show; end

  # GET /statements/new
  def new
    @statement = Statement.new
  end

  # GET /statements/1/edit
  def edit; end

  # POST /statements or /statements.json
  def create
    @statement = Statement.new(statement_params)

    respond_to do |format|
      if @statement.save
        format.html do
          redirect_to statement_url(@statement),
                      notice: 'Statement was successfully created.'
        end
        format.json { render :show, status: :created, location: @statement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @statement.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /statements/1 or /statements/1.json
  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html do
          redirect_to statement_url(@statement),
                      notice: 'Statement was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @statement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @statement.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /statements/1 or /statements/1.json
  def destroy
    @statement.destroy!

    respond_to do |format|
      format.html do
        redirect_to statements_url,
                    notice: 'Statement was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_statement
    @statement = Statement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def statement_params
    params.require(:statement).permit(:disposable_income, :ie_rating,
                                      :customer_id)
  end
end
