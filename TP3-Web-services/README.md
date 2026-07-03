# 🏦 SOAP Web Service - Banque (JAX-WS)

Ce projet est une implémentation pratique d'un **Web Service SOAP** en Java utilisant les technologies **JAX-WS** et **JAXB**. Il permet d'exposer des opérations bancaires simples (conversion de devises, consultation de comptes) via le protocole SOAP et de les consommer via différents clients.

## 📋 Fonctionnalités

Le Web Service `BanqueService` expose les opérations suivantes :
1. **`conversion(double mt)`** : Convertit un montant de l'Euro vers le Dirham Marocain (DH).
2. **`getCompte()`** : Consulte et retourne les informations d'un compte bancaire unique (Code, Solde).
3. **`getComptes()`** : Consulte et retourne la liste de tous les comptes bancaires.

## 🛠️ Technologies Utilisées

- **Langage** : Java
- **Framework Web Service** : JAX-WS (Java API for XML Web Services)
- **Mapping XML** : JAXB (Java Architecture for XML Binding)
- **Protocole** : SOAP over HTTP
- **Description** : WSDL (Web Services Description Language)
- **Outils de test** : SoapUI, Navigateur Web

---

## 🚀 Installation et Exécution

### 1. Prérequis
- **JDK 8** (Recommandé car JAX-WS est inclus nativement) 
  *⚠️ Si vous utilisez **Java 11 ou supérieur**, vous devez ajouter les dépendances Jakarta XML WS dans votre `pom.xml` (voir note en bas).*
- Un IDE Java (Eclipse, IntelliJ IDEA, NetBeans) ou un éditeur de texte.
- [SoapUI](https://www.soapui.org/) (Optionnel, pour les tests avancés).

### 2. Lancer le Serveur JAX-WS
1. Clonez ce dépôt et ouvrez-le dans votre IDE.
2. Localisez la classe `ServeurJaxWS.java`.
3. Exécutez la méthode `main`.
4. Vous devriez voir dans la console :
   ```text
   Publication du Web Service sur : http://localhost:8081/ws/banque
   Service déployé avec succès !
   WSDL disponible sur : http://localhost:8081/ws/banque?wsdl
