import javax.jws.WebMethod;
import javax.jws.WebService;
import java.util.ArrayList;
import java.util.List;

@WebService(name = "BanqueService", targetNamespace = "http://service.banque.com/")
public class BanqueService {

    @WebMethod
    public double conversion(double mt) {
        // Selon le PDF : Conversion(11) -> Return 121 (Taux de 11)
        return mt * 11; 
    }

    @WebMethod
    public Compte getCompte() {
        // Retourne un compte fictif par défaut
        return new Compte(1, 15000.50);
    }

    @WebMethod
    public List<Compte> getComptes() {
        List<Compte> liste = new ArrayList<>();
        liste.add(new Compte(1, 15000.50));
        liste.add(new Compte(2, 23000.00));
        liste.add(new Compte(3, 500.75));
        return liste;
    }
}