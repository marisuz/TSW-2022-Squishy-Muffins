package Control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.canvas.draw.SolidLine;
import com.itextpdf.layout.Document;

import com.itextpdf.layout.borders.Border;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.layout.LayoutArea;
import com.itextpdf.layout.layout.LayoutContext;
import com.itextpdf.layout.layout.LayoutResult;
import com.itextpdf.layout.property.TextAlignment;
import com.itextpdf.layout.renderer.IRenderer;

import Model.OrdineBean;
import Model.OrdineDAO;
import Model.ProdottoBean;

import java.io.*;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;

/**
 * Servlet implementation class FatturaServlet
 */
@WebServlet("/Fattura")
public class Fattura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fattura() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		OrdineDAO dao = new OrdineDAO();
		OrdineBean bean = new OrdineBean();
		double imponibile = 0.0;

		try {
			bean = dao.doRetrieveByKey(Integer.parseInt(request.getParameter("ordine")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		String percorsoPDF = getServletContext().getRealPath("/")+"WEB-INF/Fatture";
		
		File file = new File(percorsoPDF + request.getParameter("ordine") + ".pdf"); 

		try {
			bean = dao.doRetrieveByKey(Integer.parseInt(request.getParameter("ordine")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//inizio parte della fattura
        PdfFont introScriptDemo = PdfFontFactory.createFont(getServletContext().getRealPath("/") + "font/introscriptdemo-medium.woff2", "UTF8", true);
        PdfWriter pdfWriter = new PdfWriter(percorsoPDF + request.getParameter("ordine") + ".pdf");
        PdfDocument pdfDocument = new PdfDocument(pdfWriter);
        
        String imgPath = getServletContext().getRealPath("/") + "./logo.png";
        ImageData imagedata = ImageDataFactory.create(imgPath);
        Image image = new Image(imagedata);
        image.setHeight((float) 75);

        pdfDocument.setDefaultPageSize(PageSize.A4);
        float x = pdfDocument.getDefaultPageSize().getWidth() / 2;
        float y = pdfDocument.getDefaultPageSize().getHeight() / 2;

       //inizio creazione del pdf
        Document document = new Document(pdfDocument);
        float threecol = 190f;
        float colonnaUno = 85f;
        float colonnaPerTitolo = 216f;
        //array dove ogni elemento indica la dimensione della i-esima colonna
        float threeColumnWidth2[] = {colonnaUno, colonnaPerTitolo, threecol};
        float twocol = 285f;
        float twocol150 = 550f; //435f start point
        float twoColumnWidth[] = {twocol150, twocol};
        float threeColumnWidth[] = {threecol, threecol, threecol};
        float fullWidth[] = {threecol * 3};
        com.itextpdf.kernel.colors.Color rosaSito = new DeviceRgb(255, 193, 193 );
        com.itextpdf.kernel.colors.Color rosaLogo = new DeviceRgb(242, 125, 164);
        Color lightBlue = new DeviceRgb(173, 216, 230);

        //il costruttore della tabella prende in input l'array di float
        Table headerTable = new Table(threeColumnWidth2);
        headerTable.addCell(new Cell().add(image).setBorder(Border.NO_BORDER));
        //paragraph è come <p> di html
        headerTable.addCell(new Cell().add(new Paragraph("SquishyMuffins").setFont(introScriptDemo).setFontSize(38).setMarginTop(2)).setBorder(Border.NO_BORDER));
        headerTable.addCell(new Cell().add( new Paragraph("SquishyMuffins,\nVia Roma 23,\n Casapulla (CE),\nsquishymuffins@gmail.com")).setBorder(Border.NO_BORDER));
        //aggiunge al documento la tabella
        document.add(headerTable);

        //linea di separazione come <hr> di html
        LineSeparator ls = new LineSeparator(new SolidLine(1f));
        ls.setMarginTop((float) 2.0);
        document.add(ls);

        //descrizione fattura
        Table descrizione = new Table(twoColumnWidth);
        descrizione.setMarginTop((float) 10.0);
        descrizione.addCell(new Cell().add(new Paragraph(("Fattura")).setBold().setTextAlignment(TextAlignment.CENTER)).setBackgroundColor(rosaSito));
        descrizione.addCell(new Cell().add(new Paragraph(("Destinatario")).setTextAlignment(TextAlignment.CENTER)).setBold().setBackgroundColor(rosaSito));
        descrizione.addCell(new Cell().add(new Paragraph("Fattura numero: "+bean.getIdOrdine()+"\nData: "+bean.getData_ordine()).setMarginLeft(2).setMarginTop(1)));
        descrizione.addCell(new Cell().add(new Paragraph("Spettabile "+ bean.getCodUtente().getNome() + " " + bean.getCodUtente().getCognome()+"\n"+bean.getCodUtente().getCodice_fiscale()).setMarginLeft(2).setMarginTop(1)));
        document.add(descrizione);

        //linea di separazione
        ls.setMarginTop((float) 10.0);
        document.add(ls);

        //prodotti acquistati
        Table prodotti = new Table(threeColumnWidth);
        prodotti.setMarginTop(10);
        //intestazione tabella prodotti
        prodotti.addCell(new Cell().add(new Paragraph(("Prodotto")).setBold().setTextAlignment(TextAlignment.CENTER)).setBackgroundColor(rosaSito));
        prodotti.addCell(new Cell().add(new Paragraph(("Quantit�")).setBold().setTextAlignment(TextAlignment.CENTER)).setBackgroundColor(rosaSito));
        prodotti.addCell(new Cell().add(new Paragraph(("Costo")).setBold().setTextAlignment(TextAlignment.CENTER)).setBackgroundColor(rosaSito));

        //nella posizione 0 della lista ci sta qt, pos 1 iva e pos 3 della lista c'è prezzo
        for(ProdottoBean p : bean.getComposizione().keySet()) {
        	imponibile += bean.getComposizione().get(p).get(2);
            prodotti.addCell(new Cell().add(new Paragraph(p.getNome()).setMarginLeft(2).setMarginTop(1)));
            prodotti.addCell(new Cell().add(new Paragraph(String.valueOf(bean.getComposizione().get(p).get(0).intValue())).setMarginLeft(2).setMarginTop(1)));
            prodotti.addCell(new Cell().add(new Paragraph("�" + String.valueOf(bean.getComposizione().get(p).get(2).floatValue())).setMarginLeft(2).setMarginTop(1)));
        	
        }
        

        
        
        document.add(prodotti);

        //linea di separazione
        ls.setMarginTop((float) 20.0);
        document.add(ls);

        //DETTAGLI FISCALI
        Table dettagliFiscali = new Table(twoColumnWidth);
        dettagliFiscali.setMarginTop(10);

        dettagliFiscali.addCell(new Cell().add(new Paragraph(("Metodo Pagamento")).setBold().setTextAlignment(TextAlignment.CENTER)).setBackgroundColor(rosaSito));
        dettagliFiscali.addCell(new Cell().add(new Paragraph(("Costo Totale")).setBold().setTextAlignment(TextAlignment.CENTER)).setBackgroundColor(rosaSito));
        

        	dettagliFiscali.addCell(new Cell().add(new Paragraph("Mastercard").setMarginLeft(2).setMarginTop(1)));
        	dettagliFiscali.addCell(new Cell().add(new Paragraph("Imponibile: � "+imponibile+"\nSpedizione: � 5,00\nSconto: � 0,00\nIVA: 22%\n").setMarginLeft(2).setMarginTop(1)));
        	document.add(dettagliFiscali);
 

        Table totale = new Table(fullWidth);
        totale.addCell(new Cell().add(new Paragraph("Totale: � "+bean.getPrezzo_totale()).setBold().setFontSize(16).setTextAlignment(TextAlignment.RIGHT).setMarginRight(25)).setBackgroundColor(lightBlue));
        document.add(totale);
        //note
        Table note = new Table(fullWidth);
        note.setFixedPosition(20, 0 , threecol*3);
        note.addCell(new Cell().add(new Paragraph("Grazie per averci preferito!")).setBorder(Border.NO_BORDER));
        document.add(note);

        document.close(); //close salva
	    

        
	    //NON TOCCARE MAI 
	    response.setContentType("application/pdf");
	    //dove sta prova oggi devo mettere il nome del file, ossia l'id ordine
	    response.setHeader( "Content-Disposition", "attachment; filename=\"fattura.pdf\"");
	    
	    
	    
	    try(InputStream in = new FileInputStream(file)){
	            try(OutputStream out = response.getOutputStream()) {
	            	byte[] buffer = new byte[1024];
	          
	              int numBytesRead;
	              while ((numBytesRead = in.read(buffer)) > 0) {
	                  out.write(buffer, 0, numBytesRead);
	              }
	          }
	      }
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
