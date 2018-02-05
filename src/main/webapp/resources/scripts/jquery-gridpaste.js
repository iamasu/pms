/*
Copyright (c) 2011 Sean Cusack

MIT-LICENSE:

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

(function($){

  function handleGrid( pasted, options ) {
    
    // note that this is in matrix[y][x] order, due to data format:
    pasted = pasted.replace(/\r?\n$/,""); // chomp()
    var data_matrix = pasted.split(/\r?\n/).map(function(elem,idx,array){return elem.split(/\t/);});
    var editUrl = $('#jQGrid').jqGrid('getGridParam','editurl');
    // note that this is in matrix[y][x] order, also:
    for( var j=0; j<data_matrix.length; j++ ) {
      // copying from data_matrix[j] to table_matrix[j+y]
      var jsondata = "{";
      for( var i=0; i<data_matrix[j].length; i++ ) {
          jsondata = jsondata +'"'+ options.colNames[i] + "\": \""+ data_matrix[j][i] +'"';     
          if(i<data_matrix[j].length-1) jsondata +=",";
      }
      jsondata = jsondata+", \"id\": 0, \"oper\":\"add\", \"lastRow\":-1}";
      //$('#'+options.gridId).addRowData(j, JSON.parse(jsondata));
      alert(jsondata);
      $.post(editUrl,JSON.parse(jsondata),function(response, textStatus, jqXHR){
    alert(response);
  },  'json');
    }
    $('#'+options.gridId).trigger('reloadGrid');
    
//    $('#'+options.gridId).addRowData(j, JSON.parse(jsondata));
//    alert(jsondata);

    return null; // don't put anything else in the current cell
  }

	$.fn.gridpaste = function( options ) {
		if( ! options  ) options = {};
    $(this).catchpaste( handleGrid,options );
	};

})(jQuery);
