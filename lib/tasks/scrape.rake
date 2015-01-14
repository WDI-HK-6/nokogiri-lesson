namespace :scrape do 
  # this is a description of your task
  desc "Scraping Google Finance Fundamentals Data"

  # this is your task function
  task :google_finance => :environment do
    require 'open-uri'
    require 'nokogiri'

    all_companies = Company.all

    # loop thru all companies
    all_companies.each do |company|
      # just scrape one company
      puts "#{company.name} (#{company.symbol}) -- scraping in progress"
      scrape_just_one_company(company)
    end

    # at the end, I can have all the companies scraped
  end

  def scrape_just_one_company(company)
    url = "https://www.google.com/finance?q=#{company.symbol}&fstype=ii"
    site = open(url).read

    html_doc = Nokogiri::HTML(site)

    data_structure = "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td:nth-child(2).r"

    income_statement = html_doc.css(data_structure)

    # only continue of income_statement exists

    # return true of there's at least one income statement, otherwise, return false
    if not income_statement.any?
      # stop the program
      puts "#{company.name} doesn't have any income statements."
      return
    end

    new_record = company.annual_incomes.new

    AnnualIncome.columns[4..52].each_with_index do |column, index|
      new_record[column.name] = income_statement[index].text
    end
    new_record.save
  end

  desc "Scrape companies"
  task :make_companies => :environment do
    require 'open-uri'
    require 'csv'

    url = "http://s3.amazonaws.com/nvest/nasdaq_09_11_2014.csv"

    url_data = open(url)

    CSV.foreach(url_data) do |symbol, name|
      puts "#{name}: #{symbol}"
      Company.create(:name => name, :symbol => symbol)
    end
  end
end