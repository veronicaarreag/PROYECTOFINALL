<%-- 
    Document   : dinamico
    Created on : 27 oct 2022, 0:09:47
    Author     : berliz
--%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.menu" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.Map.Entry"%>
<!DOCTYPE html>
<html>
 
    <head>
        <style>
                    .bd-placeholder-img {
                      font-size: 1.125rem;
                      text-anchor: middle;
                      -webkit-user-select: none;
                      -moz-user-select: none;
                      -ms-user-select: none;
                      user-select: none;
                    }

                    @media (min-width: 768px) {
                      .bd-placeholder-img-lg {
                        font-size: 3.5rem;
                      }        .bd-placeholder-img-lg {

                    }
                    .container {
                max-width: 960px;
              }

              /*
               * Custom translucent site header
               */

              .site-header {
                background-color: rgba(0, 0, 0, .85);
                -webkit-backdrop-filter: saturate(180%) blur(20px);
                backdrop-filter: saturate(180%) blur(20px);
              }
              .site-header a {
                color: #999;
                transition: ease-in-out color .15s;
              }
              .site-header a:hover {
                color: #fff;
                text-decoration: none;
              }

              /*
               * Dummy devices (replace them with your own or something else entirely!)
               */

              .product-device {
                position: absolute;
                right: 10%;
                bottom: -30%;
                width: 300px;
                height: 540px;
                background-color: #333;
                border-radius: 21px;
                -webkit-transform: rotate(30deg);
                transform: rotate(30deg);
              }

              .product-device::before {
                position: absolute;
                top: 10%;
                right: 10px;
                bottom: 10%;
                left: 10px;
                content: "";
                background-color: rgba(255, 255, 255, .1);
                border-radius: 5px;
              }

              .product-device-2 {
                top: -25%;
                right: auto;
                bottom: 0;
                left: 5%;
                background-color: #e5e5e5;
              }


              /*
               * Extra utilities
               */

              .flex-equal > * {
                -ms-flex: 1;
                flex: 1;
              }
              @media (min-width: 768px) {
                .flex-md-equal > * {
                  -ms-flex: 1;
                  flex: 1;
                }
              }

              .overflow-hidden { overflow: hidden; }

                  </style>
        <style type="text/css">
		*{
		padding:0px;
		margin:0px;

}

#header{
	margin:auto;
	width: 500px;
	font-family: arial, helvetica, sans-serif;
}
ul,ol{
	list-style: none;
}

.nav li a{
	background-color:#000;
	color: #fff;
	text-decoration: none;
	padding: 10px 15px;
	display: block;
}

.nav li a:hover {
	background-color: #434343;
}
        .nav > li {
	float:left;

}

.nav li ul {
display: none;
position: absolute;
min-width: 140px;
}

.nav li:hover > ul {
display: block;
}

.nav li ul li {
position: relative;
}	
.nav li ul li ul {
right: -140px;
top: 0px;	
}

</style>

        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu dinamico</title>
        
    </head>
    <body>
    <center>
        <nav class="site-header sticky-top py-1">
                <div class="container d-flex flex-column flex-md-row justify-content-between">

                               <a class="py-2" href="menu.jsp" aria-label="Product">
                               <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mx-auto" role="img" viewBox="0 0 24 24" focusable="false"><title>Product</title><circle cx="12" cy="12" r="10"/><path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94"/></svg>
                               <p>Regresar</p>
                               </a>    
                             </div>
            <% 
            HttpSession sesion = request.getSession();
            String usuario;
            String nivel;
            
            if(sesion.getAttribute("user")!=null && sesion.getAttribute("user")!=null ){
                usuario = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
                out.print( "<a href='login.jsp?cerrar=true'>"+usuario +"<label>Cerrar Sesion</label></a>" );
                
            }else{
                out.print(" <script>location.replace('login.jsp'); </script>   ");
            }
            
        %>
                   </nav>
        </center>
        <h1 id="header">Menu Principal</h1>
        
            <div id="header">
            
                <% menu menu = new menu();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = menu.leer();
                    out.println("<ul class='nav'>");
                    //Inicio For
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                       
                                                     
                            if(tabla.getValueAt(t,2).equals("0")){
                                            out.println("<li><a>"+ tabla.getValueAt (t,1) + "</a>");
                                            
                                            }
                                            
                                            //Inicio Producto
                                            out.println("<ul");
                                            out.println("</li>");
                                            if(tabla.getValueAt(t,2).equals("1")){
                                                                    out.println("<li><a href='marcas.jsp'>"+ tabla.getValueAt (t,1) + "</a></li>" );            
                                                       } 
                                                       out.println("</ul>");
                                            // Fin Producto
                                            
                                            //Inicio Ventas 2
                                            out.println("<ul>");
                                            if(tabla.getValueAt(t,2).equals("3")){
                                                                    
                                                                    out.println("<li><a href='clientes.jsp'> "+ tabla.getValueAt (t,1)+ "</a></li>");
                                                                    
                                                        }
                                            if(tabla.getValueAt(t,2).equals("5")){
                                                                    out.println("<ul>");
                                                                    out.println("<li><a href='puesto.jsp'>"+ tabla.getValueAt (t,1) + "</a></li>" );
                                                                    out.println("</ul>"); 
                                                       } 
                                                       out.println("</ul>");
                                                       //Fin Ventas 2
                                                       
                                            //Inicio compras 3
                                            out.println("<ul>");
                                            if(tabla.getValueAt(t,2).equals("7")){
                                                                    
                                                                    out.println("<li><a href='proveedores.jsp'>"+ tabla.getValueAt (t,1)+ "</a></li>");
                                                                    
                                                        }
                                                       out.println("</ul>");
                                            //Fin compras 3
            
                                            //Fin del For
                                           }                         
                           out.println("</ul>");
                  %>
            
        </div>
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
