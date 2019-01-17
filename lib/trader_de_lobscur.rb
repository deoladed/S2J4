# frozen_string_literal: true
# 
require 'nokogiri'
require 'open-uri'

def crypto_scrapper
  monnaies = []
  prix = []
  ensemble = []

  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  doc.css('td[class = "text-left col-symbol"]').each do |node|
    monnaies << node.text
  end

  doc.css('a[class = "price"]').each do |node|
    prix << node.text[1..-1].to_f
  end

  monnaies.size.times do |i|
    ensemble << { monnaies[i] => prix[i] }
  end
  ensemble
end
crypto_scrapper
