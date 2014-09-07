class SearchPagesController < ApplicationController
  SORTING_OPTIONS = [['Sort By',""],['Price', 'Price'],['Distance','Distance'],['Review','Review']]
  def search
    @sorting_options = SORTING_OPTIONS
  end

  def search_result
    @sorting_options = SORTING_OPTIONS
    @all_prices = [100, 200, 300, 400]
    
    case params[:commit]
    when "Filter"
      procedure_id = params[:procedure_id]
    else
      procedure_id = params[:procedure][:procedure_id]
    end
    
    @procedure = Procedure.find(procedure_id)
    @costs = Cost.where(procedure: @procedure)
    
    @zipcode = params[:zipcode]
    unless  @zipcode.blank?
      @costs = @costs.where(practice: {zipcode: @zipcode})
    end
    
    @sort_by = params[:sort_by]
    case @sort_by
    when "Price"
      @costs = @costs.order(:price)
    end

    @name_filter = params[:name_filter]
    @price_filter = params[:prices]
    @costs = @costs.by_practice_name(@name_filter).by_price(@price_filter)

    @resorting_path = search_pages_search_result_path(
      procedure: {procedure_id: procedure_id}, 
      zipcode: @zipcode,
      name_filter: @name_filter,
      prices: @price_filter,
      )
  end
end
