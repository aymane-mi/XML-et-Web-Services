import com.service.banque.BanqueService; // Adapter le package selon la génération
import com.service.banque.BanqueService_Service;
import com.service.banque.Compte;
import java.util.List;

public class ClientSoapJava {
    public static void main(String[] args) {
        // 1. Instancier le service
        BanqueService_Service service = new BanqueService_Service();
        
        // 2. Obtenir le port (le proxy/stub pour faire les appels)
        BanqueService port = service.getBanqueServicePort();

        System.out.println("--- Test du Client SOAP Java ---");

        // Test 1: Conversion
        double montantEuro = 100.0;
        double montantDH = port.conversion(montantEuro);
        System.out.println("Conversion de " + montantEuro + " Euro = " + montantDH + " DH");

        // Test 2: Consulter un Compte
        Compte c = port.getCompte();
        System.out.println("Compte consulté -> Code: " + c.getCode() + ", Solde: " + c.getSolde());

        // Test 3: Consulter la Liste des comptes
        List<Compte> comptes = port.getComptes();
        System.out.println("Liste des comptes :");
        for (Compte cpt : comptes) {
            System.out.println(" - Code: " + cpt.getCode() + " | Solde: " + cpt.getSolde() + " DH");
        }
    }
}