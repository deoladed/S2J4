# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

def get_deputes_infos(urls)
  prenom = []
  nom = []
  nomcomplet = []
  email = []
  listefinale = []
  
  urls.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//html/body/div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a').each do |node|
    email << node.text
    end
    
    doc.xpath('//html/body/div[1]/div[5]/div/div[1]/div[1]/h1').each do |node|
    nomcomplet << node.text
    end
  end
  
    nomcomplet.each do |string|
      prenom << string.split[0]
      nom << string.split[-1]
    end

  prenom.size.times do |i|
    listefinale << { 'first_name' => prenom[i], 'last_name' => nom[i], 'email' => email[i] }
  end

  p listefinale
end


def get_deputes_urls
  urls = []
  urlcomplete = []
  doc = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
  doc.xpath('//td/a').each do |node|
  urls << node['href']
  end

  urls.each do |url|
   urlcomplete << "https://www.nosdeputes.fr#{url}" 
  end
  urlcomplete
end

def perform
  get_deputes_infos(get_deputes_urls)
end

perform