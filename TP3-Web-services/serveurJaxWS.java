import javax.xml.ws.Endpoint;

public class ServeurJaxWS {
    public static void main(String[] args) {
        String url = "http://localhost:8081/ws/banque";
        System.out.println("Publication du Web Service sur : " + url);
        
        // Publication du service
        Endpoint.publish(url, new BanqueService());
        
        
        System.out.println("Service déployé avec succès !");
        System.out.println("WSDL disponible sur : " + url + "?wsdl");
    }
}