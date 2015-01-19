# ruby encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Osoba.create([{jmeno: "Hynek", prijmeni: "Trojanek"}, {jmeno: "Matous", prijmeni: "Glanc"}, {jmeno: "Adela", prijmeni: "Richterova"}, 
  {jmeno: "Jan", prijmeni: "Hana"}, {jmeno: "Jan", prijmeni: "Rudolf"}, {jmeno: "Marie", prijmeni: "Paleckova"}, 
  {jmeno: "Jitka", prijmeni: "Svobodova"}, {jmeno: "Jiri", prijmeni: "Richter"}, {jmeno: "Barbora", prijmeni: "Aunicka"},
  {jmeno: "Anna", prijmeni: "Srubarova"}, {jmeno: "Ondrej", prijmeni: "Balik"}])

Projekt.create([{nazev: "Hlavni cinnost", kod: "1"},{nazev: "Hlavni cinnost - organizace", kod: "101"}, 
  {nazev: "Rizeni", kod: "1011"}, 
  {nazev: "Provoz", kod: "1012"}, {nazev: "Fundraising", kod: "1013"}, {nazev: "PRopaganda", kod: "1014"}, 
  {nazev: "Koordinace klientu", kod: "1015"}, {nazev: "Koordinace asistentu", kod: "1016"}, 
  {nazev: "Porady", kod: "1017"}, {nazev: "Vedlejsi cinnost", kod: "2"}, {nazev: "Rambar", kod: "201"},
  {nazev: "Dodavky", kod: "202"}, {nazev: "Projekty", kod: "3"},
  {nazev: "Vikendovky", kod: "301"}, {nazev: "Jemne vikendovky", kod: "3011"}, 
  {nazev: "Drsne vikendovky", kod: "3012"}, {nazev: "Tabory", kod: "302"}, {nazev: "Klasicke tabory", kod: "3021"}, 
  {nazev: "Drsne tabory", kod: "3022"}, {nazev: "Humr", kod: "303"}, {nazev: "Beneficni akce", kod: "304"}, 
  {nazev: "Roadtripy", kod: "305"}, {nazev: "Dilna", kod: "306"}])

User.create([{osoba_id: "1", email: "hynek.trojanek@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "2", email: "matous.glanc@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "3", email: "adela.richterova@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "4", email: "jan.hana@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "5", email: "honza.rudolf@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "6", email: "marie.paleckova@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "7", email: "jitka.svobodova@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "8", email: "jirka.richter@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "9", email: "bara.aunicka@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "10", email: "anna.srubarova@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}, 
  {osoba_id: "11", email: "ondrej.balik@ramus-os.cz", password: "kubaverich", password_confirmation: "kubaverich"}
  ])
