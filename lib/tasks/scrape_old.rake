namespace :scrape do 
  # this is a description of your task
  desc "Scraping Google Finance Fundamentals Data"

  # this is your task function
  task :google_finance => :environment do
    require 'open-uri'
    require 'nokogiri'

    # Loop through all the companies and extract each company symbol. An example of a symbol is 'AAPL' for Apple Inc.

    # Company.all # what data type does it return to me?

    # What are data types?
    # - strings
    # - integers
    # - hash
    # - array <-------
    # - boolean

    all_companies = Company.all # this is an array

    all_companies.each do |company|
      # puts company.symbol
    end

    # Open the corresponding websites for each company based on a set of URLs

    # Open the Apple website
    url = "https://www.google.com/finance?q=AAPL&fstype=ii"
    site = open(url).read

    # Getting the site ready to be parse using Nokogiri
    html_doc = Nokogiri::HTML(site)

    # Identify the data structure that I would like to scrape. This can be found from Kimono
    data_structure = "div.id-incannualdiv > table.gf-table.rgt > tbody > tr > td:nth-child(2).r"

    # Parse the site using the data structure format
    income_statement = html_doc.css(data_structure)

    # print it to see if it's correct!
    # puts income_statement

    # Create a new record
    new_record = AnnualIncome.new

    # what data type does new_record have?
    # array?
    # hash? <----
    # integer?
    # string?
    # boolean?

    # retrieve all the columns name in AnnualIncome table

    # AnnualIncome.columns -> what data type do I get? Array of Hashes

    # cat_count = 1

    # puts "I have " + cat_count.to_s + " cat."
    # puts "I have #{cat_count} cat."
    
    puts income_statement

    AnnualIncome.columns[4..52].each_with_index do |column, index|
      # puts "#{index} - #{column.name}"
      
      # I want to store this annual incomes to my database
      # new_record.currency # this is correct

      # An example of assigning values to revenue
      # new_record["revenue"] = income_statement[0].text

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