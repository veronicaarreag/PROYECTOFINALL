<%-- 
    Document   : proveedores
    Created on : 24 oct 2022, 16:04:41
    Author     : berliz
--%>
<%@page session="true" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.Map.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Proveedor" %>
<%@page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
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
                   <!-- Agregar imagen, copiar url en el SRC -->          
                    <p><img src="" heigth=10% width=10% /></p>
        
       <div class="container mt-3">
        <h1>Proveedores</h1>
        
           <div class="modal fade" id="modal_puesto">
  <div class="modal-dialog">
    <div class="modal-content">
        
        <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Formulario Puestos</h4>
      </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <form action="sr_puesto" method="post" class="form-group">
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping">Id puesto</span>
                        <input type="text" name="txt_idpuesto" id="txt_idpuesto" value="0" class="form-control" placeholder="0" aria-label="Puesto" aria-describedby="addon-wrapping" readonly>
                    </div>
                    <br>
                    <div class="input-group flex-nowrap">
                        <span class="input-group-text" id="addon-wrapping">Puesto</span>
                        <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Puesto" aria-label="Puesto" aria-describedby="addon-wrapping" required>
                    </div>
            <br>
            
            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                <button name="btn_agregar" value="agregar" class="btn btn-success" id="btn_agregar">Agregar</button>
                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>   
            </div>
            
        </form>
      </div>
        
       
         
        </div>    
   </div>
</div>
            
      <!-- The Modal -->
        <div class="modal fade" id="modal_proveedor">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Formulario Proveedor</h4>
       </div>    
        
          <!-- Modal body -->
        <div class="modal-body">
        <form action="sr_proveedores1" method="post" class="form-group">
            
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Id Proveedor</span>
                <input type="text" name="txt_idproveedor" id="txt_idproveedor" value="0"class="form-control" placeholder="0" aria-label="Puesto" aria-describedby="addon-wrapping" readonly>
            </div>
            <br>
            
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Proveedor</span>
                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Zapato Loco S.A." aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Nit</span>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="12345678-9" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Direccion</span>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Guatemala" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Telefono</span>
                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="12345678" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
                  
             <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                 
                <button name="btn_agregar" value="agregar" class="btn btn-success" id="btn_agregar">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary" > Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?, consulte de nuevo')) return false" > Eliminar </button>
                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                
            </div>     
        </form>
        </div>
      </div>

    </div>
  </div>
  
      <!-- Inicio de la Tabla Leer -->
            <table class="table table-dark table-hover" >
                <thead >
                <tr>
                    <th>Proveedor</th>
                    <th>Nit</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                </tr>
                </thead>
                <tbody id="tbl_proveedor">
                
                <% Proveedor proveedor = new Proveedor();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = proveedor.leer();
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0)+" data-id_p=" + tabla.getValueAt(t, 4)+">");
                            out.println("<td>"+ tabla.getValueAt (t,1) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,2) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,3) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,4) + "</td>");
                            out.println("</tr>");
                        }
                  %>
                  
                  
                </tbody>
                
            </table>
                  
                  <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#modal_proveedor" onclick="limpiar()">Nuevo Registro</button>
                  </div>
                         

  
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
            
            function myFunction() {
            var option_value = document.getElementById("numbers").value;
            if (option_value === "?") {
              //  alert("Hai !");
               $("#modal_puesto").modal();
             }
            }
            
            
            function limpiar(){
                $('#txt_idproveedores').val(0);
                $('#dr_puesto').val(1);
                $('#txt_proveedor').val('');
                $('#txt_nit').val('');
                $('#txt_direccion').val('');
                $('#txt_telefono').val('');
    
            }
            
            $('#tbl_proveedor').on('click','tr td',function(evt){
                var target,id,id_p,proveedor,nit,direccion,telefono;
                target = $(event.target);
                id =            target.parent().data('id');
                id_p =          target.parent().data('id_p');
                proveedor =     target.parent("tr").find("td").eq(0).html();
                nit =           target.parent("tr").find("td").eq(1).html();
                direccion =     target.parent("tr").find("td").eq(2).html();
                telefono =      target.parent("tr").find("td").eq(3).html();
                
                
                $('#txt_idproveedor').val(id);
                $('#txt_proveedor').val(proveedor);
                $('#txt_nit').val(nit);
                $('#txt_direccion').val(direccion);
                $('#txt_telefono').val(telefono);
                $("#modal_proveedor").modal('show');
            });
            
            
        </script>              
                    
                    
                    
                    
        
    </body>
</html>
