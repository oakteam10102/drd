class SearchPagesController < ApplicationController
  SORTING_OPTIONS = [['Sort By',""],['Price', 'Price'],['Distance','Distance'],['Review','Review']]
  def search
    @sorting_options = SORTING_OPTIONS
  end

  def search_result
    @sorting_options = SORTING_OPTIONS
    
    case params[:commit]
    when "Filter"
      procedure_id = params[:procedure_id]
    when "Search"
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
    @costs = @costs.by_practice_name(@name_filter)
  end
end
