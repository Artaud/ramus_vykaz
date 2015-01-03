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

Projekt.create([{nazev: "Hlavni cinnost", kod: "131"},{nazev: "Hlavni cinnost - organizace", kod: "13101"}, {nazev: "Rizeni", kod: "131011"}, 
  {nazev: "Provoz", kod: "131012"}, {nazev: "Fundraising", kod: "131013"}, {nazev: "PRopaganda", kod: "131014"}, 
  {nazev: "Koordinace klientu", kod: "131015"}, {nazev: "Koordinace asistentu", kod: "131016"}, 
  {nazev: "Porady", kod: "131017"}, {nazev: "Vedlejsi cinnost", kod: "132"}, {nazev: "Rambar", kod: "13201"},
  {nazev: "Dodavky", kod: "13202"}, {nazev: "Projekty", kod: "133"},
  {nazev: "Vikendovky", kod: "13301"}, {nazev: "Jemne vikendovky", kod: "133011"}, 
  {nazev: "Drsne vikendovky", kod: "133012"}, {nazev: "Tabory", kod: "13302"}, {nazev: "Klasicke tabory", kod: "133021"}, 
  {nazev: "Drsne tabory", kod: "133022"}, {nazev: "Humr", kod: "13303"}, {nazev: "Beneficni akce", kod: "13304"}, 
  {nazev: "Roadtripy", kod: "13305"}, {nazev: "Dilna", kod: "13306"}])

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
