package Modelo;

import java.sql.Date;
import java.sql.Time;


/**
 *
 * @author leora
 */
public class Ruta {
        

    private String idruta, origen, destino;
    private Date fecha;
    private Time hora;
    private int puestos, puestoslibres, precio;

    public Ruta(String idruta, String origen, String destino, Date fecha, Time hora, int puestos, int puestoslibres, int precio) {
        this.idruta = idruta;
        this.origen = origen;
        this.destino = destino;
        this.fecha = fecha;
        this.hora = hora;
        this.puestos = puestos;
        this.puestoslibres = puestoslibres;
        this.precio = precio;
    }
    
    public Ruta() {
	}
    
    public String getIdruta() {
        return idruta;
    }

    public void setIdruta(String idruta) {
        this.idruta = idruta;
    }
    
    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public int getPuestos() {
        return puestos;
    }

    public void setPuestos(int puestos) {
        this.puestos = puestos;
    }

    public int getPuestoslibres() {
        return puestoslibres;
    }

    public void setPuestoslibres(int puestoslibres) {
        this.puestoslibres = puestoslibres;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Ruta{" + "idruta=" + idruta + ", origen=" + origen + ", destino=" + destino + ", fecha=" + fecha + ", hora=" + hora + ", puestos=" + puestos + ", puestoslibres=" + puestoslibres + ", precio=" + precio + '}';
    }
      
}
