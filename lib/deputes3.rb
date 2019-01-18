# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

def get_deputes_infos#(urls)
  prenom = []
  nom = []
  nomcomplet = []
  email = []
  listefinale = []
  
  # urls.each do |url|
    doc = Nokogiri::HTML('http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA719404')
    doc.css('//html/body/div[3]/div/div/div/section[1]/div/article/div[2]/h1').each do |node|
    nomcomplet << node.text
    end

    doc2 = Nokogiri::HTML('https://www.nosdeputes.fr/deputes')
    doc2.css('a').css('div').css('span.list_nom').each do |node|
    nomcomplet << node.text
    end
  # end
  
  p nomcomplet
    # nomcomplet.each do |string|
    #   prenom << string.split[0]
    #   nom << string.split[-1]
    # end

  # prenom.size.times do |i|
  #   listefinale << { 'first_name' => prenom[i], 'last_name' => nom[i], 'email' => email[i] }
  # end

  # p listefinale
end
get_deputes_infos

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

# def perform
#   get_deputes_infos#(get_deputes_urls)
# end

# perform