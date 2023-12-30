# frozen_string_literal: true

class StatementsController < ApplicationController
  before_action :set_statement, only: %i[show edit update destroy]

  def index
    @statements = current_customer.this_month_statements
  end

  def show; end

  def new
    @statement = Statement.new
    @statement.statement_items.build
  end

  def edit; end

  def create
    @statement = Statement.new(statement_params)

    respond_to do |format|
      if @statement.save
        format.html do
          redirect_to statement_url(@statement),
                      notice: 'Statement was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @statement.update(statement_params)
        format.html do
          redirect_to statement_url(@statement),
                      notice: 'Statement was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @statement.destroy!

    respond_to do |format|
      format.html do
        redirect_to statements_url,
                    notice: 'Statement was successfully destroyed.'
      end
    end
  end

  private

  def set_statement
    @statement = current_customer.statements.find(params[:id])
  end

  def statement_params
    params.require(:statement).permit(
      :customer_id, statement_items_attributes: %i[
        id title amount transaction_type _destroy
      ]
    )
  end
end
