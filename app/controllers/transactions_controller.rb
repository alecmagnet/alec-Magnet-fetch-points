class TransactionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

	# POST /transactions
	def create
		if transaction_params.points > 0
			transaction = Transaction.create!(transaction_params)
			head :created
		else

		end
	end


	private

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def transaction_params
    params.permit(:payer, :points, :timestamp)
  end

	def find_oldest_non_zero(vendor)
		Transaction.filter
	end


end
