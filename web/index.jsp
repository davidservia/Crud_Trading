<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mis suscriptores del canal Tecno-Campanillas</title>
        <style>
            .contenedor {
                padding:8em;
            }
        </style>
    </head>
    <body>
        <div class="container">
        <h1>Mis suscriptores del canal Tecno-Campanillas</h1>
        <h2>Añadir nuevo suscripción</h2>
        <h2>Introduzca los datos del nuevo socio:</h2>
        
        
    <form method="get" action="grabaSocio.jsp">
    Nº socio <input type="int" name="id"/></br>
    Nombre <input type="text" name="nombre"/></br>
    Estatura <input type="text" name="correo"/></br>
    Edad <input type="text" name="Pais"/></br>
    <input type="submit" value="Aceptar">
    </form>

        
        <%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion = DriverManager.getConnection("jdbc:mysql://172.31.15.211:3308/baloncesto?useSSL=false&allowPublicKeyRetrieval=true","root", "root");
          Statement s= conexion.createStatement();
          ResultSet listado = s.executeQuery("SELECT * FROM suscriptor");
          %>
          
          <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Nombre</th>
      <th scope="col">Correo electrónico</th>
      <th scope="col">Pais</th>
    </tr>
  </thead>
  <tbody>
          <%
        while (listado.next()) {
            %>
    <tr>
        
            <td><%=listado.getString("id")%> </td>
            <td><%=listado.getString("nombre")%> </td>
            <td><%=listado.getString("email")%> </td>
            <td><%=listado.getString("pais")%> </td>
        
    </tr>
            <%
        //out.println(listado.getString("nombre") + " " + listado.getString("email") + listado.getString("pais") + "<br>");
        }

        %>
  </tbody>
          </table>
  </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
