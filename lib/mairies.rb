# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

def get_townhall_email(urls)
  ville = []
  email = []

  urls.each do |townhall_url|
    doc = Nokogiri::HTML(open(townhall_url))
    doc.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
    email << node.text
    end

    doc.xpath('//strong/a[@class = "lientxt4"]').each do |node|
    ville << node.text.capitalize
    end
  end
  p ensemble = Hash[ville.zip(email)]
end


def get_townhall_urls(alltownhall_url)
  urls = []
  urlcomplete = []
  doc = Nokogiri::HTML(open(alltownhall_url))
  doc.xpath('//p/a').each do |node|
  urls << node['href'][1..-1]
  end
    urls.each do |url|
      urlcomplete << "https://www.annuaire-des-mairies.com#{url}" 
    end
  urlcomplete
end

def perform
get_townhall_email(get_townhall_urls("http://annuaire-des-mairies.com/val-d-oise.html"))
end

perform