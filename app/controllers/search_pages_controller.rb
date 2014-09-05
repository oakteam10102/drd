class SearchPagesController < ApplicationController
  SORTING_OPTIONS = [['Sort By',""],['Price', 'Price'],['Distance','Distance'],['Review','Review']]
  def search
    @sorting_options = SORTING_OPTIONS
  end

  def search_result
    @sorting_options = SORTING_OPTIONS
    @procedure = Procedure.find(params[:procedure][:procedure_id])
    @practices = @procedure.practices.all
    @zipcode = params[:zipcode]
    unless  @zipcode.blank?
      @practices = @practices.where(zipcode: @zipcode)
    end
    @sort_by = params[:sort_by]
    unless @sort_by.blank?
      case @sort_by
      when "Price"
      end
    end
  end
end
