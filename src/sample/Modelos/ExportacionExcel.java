package sample.Modelos;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;

public class ExportacionExcel {
    private static String nombreArchivo = "REGPS101_EXT_5467.xlsx";
    private static String rutaArchivo = "/home/adonay-calix/Documentos/OfertaAcadenica/" + nombreArchivo;
    private static int contadorFila = 0;
    private final static int inicioFila = 6;
    private final static int maximoColumna = 16;

    public static void leerDatos() {
        try {
            FileInputStream archivoExel = new FileInputStream(new File(rutaArchivo));
            XSSFWorkbook worbook = new XSSFWorkbook(archivoExel);
            XSSFSheet sheet = worbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator();
            Row row;

            while (rowIterator.hasNext()) {

                row = rowIterator.next();
                Iterator<Cell> cellIterator = row.cellIterator();
                Cell cell;

                int contadorColumnas = 0;

                while (cellIterator.hasNext()) {

                    cell = cellIterator.next();

                    if (contadorFila >= inicioFila && contadorColumnas <= maximoColumna) {
                        if(!(contadorColumnas == 15 || contadorColumnas == 14 || contadorColumnas == 4 || contadorColumnas == 5)){
                            switch (cell.getCellType()) {
                                case Cell.CELL_TYPE_NUMERIC:
                                    if (DateUtil.isCellDateFormatted(cell)) {
                                        System.out.print(cell.getDateCellValue() + "  ");
                                    } else {
                                        System.out.print(cell.getNumericCellValue() + "  ");
                                    }
                                    break;
                                case Cell.CELL_TYPE_STRING:
                                    System.out.print(cell.getStringCellValue() + "  ");
                                    break;
                                case Cell.CELL_TYPE_BOOLEAN:
                                    System.out.print(cell.getBooleanCellValue() + "  ");
                                    break;
                                case Cell.CELL_TYPE_BLANK:
                                    System.out.println("  ");
                                    break;
                            }
                        }
                    }
                    contadorColumnas++;
                }
                if (contadorFila >= 6) {
                    System.out.println();
                }
                contadorFila++;
            }
        } catch (Exception e) {
            e.getMessage();
        }
    }
}
