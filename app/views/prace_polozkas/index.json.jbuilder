json.array!(@prace_polozkas) do |prace_polozka|
  json.extract! prace_polozka, :id, :osoba_id, :projekt_id, :datum, :obsah, :hodiny
  json.url prace_polozka_url(prace_polozka, format: :json)
end
