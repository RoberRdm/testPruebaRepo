public with sharing class TestApiRestConsumer {
    // Aquí irá la lógica para consumir el servicio REST
    public TestApiRestConsumer() {
        // Constructor
    }
    
    // Método para consumir el endpoint GET de TestApiRest
    public static void consumirGet() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        // Usa el nombre del Named Credential Legacy que creaste, por ejemplo 'TestApiRestNC'
        request.setEndpoint('callout:TestApiRestNC/services/apexrest/testApiRest/');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('Status: ' + response.getStatusCode());
        System.debug('Body: ' + response.getBody());
    }
}
