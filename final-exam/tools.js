var doc = new jsPDF();

$('#generatePDF').click(function () {  
    var pdf = new jsPDF();
    var specialElementHandlers = {
      '#generatePDF': function (element, renderer) {
          return true;
      }
    };

    var $temp = $('#pdfContainer');
    pdf.fromHTML($temp.html(), 15, 15, {
          'width': 200,
          'elementHandlers':specialElementHandlers
          }
    );
    pdf.save('transReport.pdf');
  });
