@RestResource(urlMapping='/testApiRest/*')
global with sharing class TestApiRest {
    public TestApiRest() {

    }

    @HttpGet
    global static List<WrapperTestApiRest> getInfo() {
        List<Account> accList = [SELECT Id, Name, Description, CreatedDate FROM Account LIMIT 2];
        List<WrapperTestApiRest> result = new List<WrapperTestApiRest>();
        for (Account acc : accList) {
            WrapperTestApiRest obj = new WrapperTestApiRest();
            obj.id = acc.Id;
            obj.nombre = acc.Name;
            obj.descripcion = acc.Description;
            obj.fechaCreacion = String.valueOf(acc.CreatedDate);
            result.add(obj);
        }
        return result;
    }

    @HttpPost
    global static String createAccount() {
        // Leer el cuerpo de la petición
        RestRequest req = RestContext.request;
        String jsonBody = req.requestBody.toString();
        // Deserializar el JSON a la clase wrapper
        WrapperTestApiRest data = (WrapperTestApiRest) JSON.deserialize(jsonBody, WrapperTestApiRest.class);
        // Crear un nuevo Account usando los datos recibidos
        Account acc = new Account();
        acc.Name = data.nombre;
        acc.Description = data.descripcion;
        insert acc;
        return acc.Id;
    }
}