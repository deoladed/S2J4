# frozen_string_literal: true

require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  monnaies = []
  prix = []

  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  doc.css('td[class = "text-left col-symbol"]').each do |node|
    monnaies << node.text
  end

  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  doc.css('a[class = "price"]').each do |node|
    prix << node.text[1..-1].to_f
  end

  ensemble = Hash[monnaies.zip(prix)]
end
crypto_scrapper

# <td class=>BTC</td>

# /html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[1]/td[3]
# /html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[2]/td[3]
# data-usd
# doc.xpath('//html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[1]/td[3]', '//html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[1]/td[5]/a').each do |link|
#   puts link.content
