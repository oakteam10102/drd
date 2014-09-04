class SearchPagesController < ApplicationController
  def search
  end

  def search_result
    @procedure = Procedure.find(params[:procedure][:procedure_id])
    @practices = @procedure.practices.all
    @zipcode = params[:zipcode]
    unless  @zipcode.blank?
      @practices = @practices.where(zipcode: @zipcode)
    end
  end
end
