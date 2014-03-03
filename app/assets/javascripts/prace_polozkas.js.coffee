# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $("#prace_polozkas").dataTable
    fnHeaderCallback: (nRow, aaData, iStart, iEnd, aiDisplay) ->
      HodinovaMzda=50
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
      bunka[6].innerHTML="Součet = " + parseInt(iStranaSoucet) + "h; " + parseInt(iStranaSoucet*HodinovaMzda) + " Kč"
      
      #nCells = nRow.getElementsByTagName("td")
      #nCells[4].innerHTML = "Součet = " + parseInt(iStranaSoucet) + "h, tj. " + parseInt(iStranaSoucet*HodinovaMzda) + " Kč"
      
      
    sPaginationType: "full_numbers"
    bStateSave: true
    aoColumns: [
        { "bSortable": true },
        { "bSortable": true },
        { "bSortable": true },
        { "bSortable": true },
        { "bSortable": true },
        { "bSortable": false },
        { "bSortable": false }]
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
  

$(document).ready(ready)
$(document).on('page:load', ready)
$(document).on('page:restore', ready)



