import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "compte")
@XmlAccessorType(XmlAccessType.FIELD)
public class Compte {
    private int code;
    private double solde;

    // Constructeur par défaut (obligatoire pour JAXB)
    public Compte() {}

    public Compte(int code, double solde) {
        this.code = code;
        this.solde = solde;
    }

    public int getCode() { return code; }
    public void setCode(int code) { this.code = code; }
    public double getSolde() { return solde; }
    public void setSolde(double solde) { this.solde = solde; }
}