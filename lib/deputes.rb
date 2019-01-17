# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

def deputes
  liste = []
  nom = []
  prenom = []
  email = []
  listefinale = []

  doc = Nokogiri::HTML(open('https://wiki.laquadrature.net/Contactez_vos_d%C3%A9put%C3%A9s'))
  doc.xpath('//li').each do |node|
    liste << node.text
  end

  liste.pop(32) && liste.shift(20)
  liste.each do |string|
    prenom << string.scan(/(\b[A-Za-z\-éèôçöÈÉÊ]*\b) +\b[A-Za-z]*\b/).join
    nom << string.scan(/\b[A-Za-z]*\b +([A-Za-z\sA-Za-z]*)/).join
    email << string.scan(/\b[a-z\.\-]*[@][a][s][s][e][m][b][l][e][e][-][n][a][t][i][o][n][a][l][e][.][f][r]\b/).join
  end

  672.times do |i|
    listefinale << { 'first_name' => prenom[i], 'last_name' => nom[i], 'email' => email[i] }
  end
  listefinale
end
deputes

# ps: je prefere
# {   first_name: prenom[i],
#     last_name: nom[i],
#     email: email[i]}
