class SearchPagesController < ApplicationController
  def search
  end

  def search_result
    @procedure = Procedure.find(params[:procedure][:procedure_id])
    @practices = @procedure.practices.all
  end
end
