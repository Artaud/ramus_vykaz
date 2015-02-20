# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery.extend jQuery.fn.dataTableExt.oSort,
  "date-eu-pre": (date) ->
    date = date.replace(" ", "")
    if date.indexOf(".") > 0

      #date a, format dd.mn.(yyyy) ; (year is optional)
      eu_date = date.split(".")
    else

      #date a, format dd/mn/(yyyy) ; (year is optional)
      eu_date = date.split("/")

    #year (optional)
    if eu_date[2]
      year = eu_date[2]
    else
      year = 0

    #month
    month = eu_date[1]
    month = 0 + month  if month.length is 1

    #day
    day = eu_date[0]
    day = 0 + day  if day.length is 1
    (year + month + day) * 1

  "date-eu-asc": (a, b) ->
    (if (a < b) then -1 else ((if (a > b) then 1 else 0)))

  "date-eu-desc": (a, b) ->
    (if (a < b) then 1 else ((if (a > b) then -1 else 0)))

dTable = ->
  $("#prace_polozkas").dataTable
    fnHeaderCallback: (nRow, aaData, iStart, iEnd, aiDisplay) ->
      HodinovaMzda=60
      i=0
      iTotalSoucet=0

      while i<aaData.length
        iTotalSoucet += aaData[i][4] * 1
        i++

      iStranaSoucet=0
      i=iStart

      while i<iEnd
        iStranaSoucet += aaData[aiDisplay[i]][4] * 1
        i++

      bunka=document.getElementsByTagName("th")
      bunka[6].innerHTML="Součet = " + parseFloat(iStranaSoucet) + "h; " + parseInt(iStranaSoucet*HodinovaMzda) + " Kč"

      #nCells = nRow.getElementsByTagName("td")
      #nCells[4].innerHTML = "Součet = " + parseInt(iStranaSoucet) + "h, tj. " + parseInt(iStranaSoucet*HodinovaMzda) + " Kč"

    sPaginationType: "full_numbers"
    bStateSave: false#true
    aoColumns: [
        { "bSortable": true, "sType": "date-eu", "sWidth": '8%' },
        { "bSortable": true, "sWidth": null },
        { "bSortable": true, "sWidth": null },
        { "bSortable": true, "bSearchable": false, "sWidth": null },
        { "bSortable": true, "bSearchable": false, "sWidth": '6%' },
        { "bSortable": false, "bSearchable": false, "sWidth": '8%' },
        { "bSortable": false, "bSearchable": false, "sWidth": '8%' }]
    aaSorting: [[0,'desc']]
    sScrollX: "100%", # horizontal scrolling
    bScrollCollapse: true, # horizontal scrolling
    oLanguage:
      oPaginate:
        sFirst: "<<"
        sLast: ">>"
        sPrevious: "<"
        sNext: ">"
      sProcessing: "načítám"
      sInfo: "Zobrazuji záznamy _START_ - _END_ (z celkových _TOTAL_)"
      sInfoFiltered: " - filtrováno _MAX_ záznamů"
      sSearch: "Filtr:"
      sLengthMenu: '<select>'+
        '<option value="10">10</option>'+
        '<option value="20">20</option>'+
        '<option value="30">30</option>'+
        '<option value="40">40</option>'+
        '<option value="50">50</option>'+
        '<option value="-1">\u221e</option>'+
        '</select> řádků na stránce'


$(document).ready(
  dTable
  $('#min').keyup ->
    dTable.fnDraw()
    return
  $('#max').keyup ->
    dTable.fnDraw()
    return
)
$(document).on('page:load', dTable)
$(document).on('page:restore', dTable)



