class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @annualincome = @company.annualincomes.first
  end
end
