class CreateAnnualincomes < ActiveRecord::Migration
  def change
    create_table :annualincomes do |t|
      t.integer :company_id

      t.string :currency
      t.date :period
      t.decimal :revenue
      t.decimal :otherrevenue
      t.decimal :totalrevenue
      t.decimal :totalcostofrevenue
      t.decimal :grossprofit
      t.decimal :generalexpense
      t.decimal :randd  
      t.decimal :depreciation
      t.decimal :interestexpense
      t.decimal :unusualexpense
      t.decimal :otheroperatingexpense
      t.decimal :totaloperatingexpense
      t.decimal :operatingincome 
      t.decimal :interestincome
      t.decimal :gainonsaleofasset
      t.decimal :otherincome
      t.decimal :incomebeforetax
      t.decimal :incomeaftertax
      t.decimal :minorityinterest
      t.decimal :equityinaffiliates
      t.decimal :netincomebeforeextraitem
      t.decimal :accountingchange
      t.decimal :discontinuedoperations
      t.decimal :extraitem
      t.decimal :netincome
      t.decimal :preferreddividends
      t.decimal :incomeavailabletocommonexclextra
      t.decimal :incomeavailabletocommoninclextra
      t.decimal :basicweightedaverageshares
      t.decimal :basicepsexclextraitems
      t.decimal :basicepsinclextraitems
      t.decimal :dilutionadjustment
      t.decimal :dilutedweightedaverageshares
      t.decimal :dilutedepsexclextraitems
      t.decimal :dilutedepsinclextraitems
      t.decimal :dividendspershare
      t.decimal :grossdividends
      t.decimal :netincomeafterstockexpense
      t.decimal :basicepsafterstockexpense
      t.decimal :dilutedepsafterstockexpense
      t.decimal :supplementdepreciation
      t.decimal :totalspecialitems
      t.decimal :normalizedincomebeforetaxes
      t.decimal :effectofspecialitemsonincometaxes
      t.decimal :incometaxesimpactofspecialitems
      t.decimal :normalizedincomeaftertaxes
      t.decimal :normalizedincomeavailtocommon
      t.decimal :basicnormalizedeps
      t.decimal :dilutednormalizedeps

      t.timestamps
    end
  end
end
