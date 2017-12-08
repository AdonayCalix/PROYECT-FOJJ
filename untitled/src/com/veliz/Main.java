package com.veliz;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.util.Iterator;

import static org.apache.poi.ss.usermodel.DateUtil.isCellDateFormatted;

public class Main {

    public static void main(String[] args) {
        String nombreArchivo = "juanca.xlsx";
        String rutaArchivo = "C:\\Users\\veliz\\Documents\\tareas\\9 periodo\\programacion orientada a objetos\\" + nombreArchivo;
        System.out.println(rutaArchivo);
        String hoja = "Sheet1";

        try (FileInputStream file = new FileInputStream(new File(rutaArchivo))) {
            // leer archivo excel
            XSSFWorkbook worbook = new XSSFWorkbook(file);
            //obtener la hoja que se va leer
            XSSFSheet sheet = worbook.getSheetAt(0);
            //obtener todas las filas de la hoja excel
            Iterator<Row> rowIterator = sheet.iterator();

            Row row;
            // se recorre cada fila hasta el final
            while (rowIterator.hasNext()) {
                row = rowIterator.next();
                //se obtiene las celdas por fila
                Iterator<Cell> cellIterator = row.cellIterator();
                Cell cell;
                //se recorre cada celda



                int cont=0;//realizar un contador para ver que valor es

                while (cellIterator.hasNext()) {

                    // se obtiene la celda en espec�fico y se la imprime
                    cell = cellIterator.next();
                    //*************************************************************
                    switch(cell.getCellType()) {


                        case Cell.CELL_TYPE_NUMERIC:
                            //String fechaInicio = Cell.CELL_TYPE_NUMERIC
                            if( DateUtil.isCellDateFormatted(cell) ) {

                                System.out.print(cell.getDateCellValue());
                           //     System.out.print(cell.getCellTypeEnum() + " | ");

                            }
                            else {

                            System.out.print(cell.getNumericCellValue());

                        }

                        break;

                        case Cell.CELL_TYPE_STRING:

                            System.out.print(cell.getStringCellValue());

                            break;

                        case Cell.CELL_TYPE_BOOLEAN:

                            System.out.print(cell.getBooleanCellValue());

                            break;

                    }
               //************************************************************
                }
                System.out.println();
            }
        } catch (Exception e) {
            e.getMessage();
        }
    }
}
