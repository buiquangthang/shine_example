class CustomersController < ApplicationController
  PAGE_SIZE = 10

  def index
    @page = (params[:page] || 0).to_i

    if params[:keywords].present?
      @keywords = params[:keywords]
      customer_search_term = CustomerSearchTerm.new(@keywords)
      @customers = Customer.where(customer_search_term.where_clause,
        customer_search_term.where_args).order(customer_search_term.order)
        .offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else
      @customers = []
    end

    respond_to do |format|
      format.html {}
      format.json {
        render json: { customers: @customers }
      }
    end
  end

  def show
    customer = Customer.find(params[:id])
    respond_to do |format|
      format.json do
        render json: {
        customer: customer,
        shipping_address: customer.primary_shipping_address,
        billing_address: customer.billing_address,
        }
      end
    end
  end
end
