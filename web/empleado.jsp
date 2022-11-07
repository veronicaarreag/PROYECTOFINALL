<%-- 
    Document   : empleado
    Created on : 24/10/2022, 02:13:50
    Author     : berliz
--%>
<%@page session="true" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.Map.Entry"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Puesto" %>
<%@page import="modelo.Empleado" %>
<%@page import="java.util.HashMap" %>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empleados</title>    
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="puesto.jsp"/>
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
        <h1>Empleados</h1>

        
        <!-- The Modal -->
        <div class="modal fade" id="modal_empleado">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Formulario Empleados</h4>
       </div>

      <!-- Modal body -->
      <div class="modal-body">
        <form action="sr_empleado" method="post" class="form-group">
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Id Empleado</span>
                <input type="text" name="txt_id_emple" id="txt_id_emple" class="form-control" placeholder="0" readonly>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Nombre</span>
                <input type="text" name="txt_nomb" id="txt_nomb" class="form-control" placeholder="Gustavo"required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Apellidos</span>
                <input type="text" name="txt_apelli" id="txt_apelli" class="form-control" placeholder="Aleman" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Direccion</span>
                <input type="text" name="txt_direcc" id="txt_direcc" class="form-control" placeholder="Guatemala"required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Telefono</span>
                <input type="text" name="txt_telef" id="txt_telef" class="form-control" placeholder="78450012" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">DPI</span>
                <input type="text" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="0000-00000-0000"required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Genero</span>
                <select name="txt_gen" id="txt_gen" class="form-control">
                    <option disabled selected>Selecciona genero</option>
                    <option value="1">Hombre</option> 
                    <option value="0">Mujer</option>
                    </select>
                    </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Fecha de Nacimiento</span>
                <input type="date" name="txt_nacimiento" id="txt_nacimiento" class="form-control" placeholder="dd/mm/yyyy"required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Puesto</span>
                <select id = "numbers" onchange = "Function()" name="dr_puesto" id="dr_puesto" class="form-control">
                 <% Puesto puesto = new Puesto();
                HashMap<String,String> drop = puesto.drop_puesto();
                    for(String i : drop.keySet()){
                    out.println("<option value='" + i +"'>" + drop.get(i) + "</option>");
                    }
                %>
                
                 <option value="?">+Agregar puesto</option>
                </select>
            </div>
                
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Fecha inicio de labores</span>
                <input type="date" name="txt_FIL" id="txt_FIL" class="form-control" placeholder="dd/mm/yyyy" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Fecha de ingreso</span>
                <input type="datetime-local" name="txt_FI" id="txt_FI" class="form-control" placeholder="dd/mm/yyyy"  required>
            </div>
            <br>
            
                <button name="btn_agregar" value="agregar" class="btn btn-success" id="btn_agregar">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-primary" > Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?, consulte de nuevo')) return false" > Eliminar </button>
                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
            
        </form>
      </div>

    </div>
  </div>
</div>   
                
        
            <table class="table table-dark table-hover">
                <thead >
                <tr>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>DPI</th>
                    <th>Genero</th>
                    <th>Fecha nacimiento</th>
                    <th>Puesto</th>
                    <th>Fecha de inicio de labores</th>
                    <th>Fecha de ingreso</th>
                </tr>
                </thead>
                <tbody id="tbl_empleado">
                
                <% Empleado empleado = new Empleado();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = empleado.leer();
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                           
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0)+" data-id_p=" + tabla.getValueAt(t, 11)+">");
                            out.println("<td>"+ tabla.getValueAt (t,1) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,2) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,3) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,4) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,5) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,6) + "</td>");                            
                            out.println("<td>"+ tabla.getValueAt (t,7) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,8) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,10)+ "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,11)+ "</td>");
                            out.println("</tr>");
                            
                        }
                  %>
                  
                  
                </tbody>
                
            </table>
                  
          <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">Nuevo Registro</button>
        </div>
        
      
       <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>           
                  
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
        
        
    <script type="text/javascript">
            function Function() {
            var option_value = document.getElementById("numbers").value;
            if (option_value === "?") {
              //  alert("Hai !");
               $("#modal_puesto").modal();
             }
            }
            
            function limpiar(){
                $('#txt_id_emple').val(0);
                $('#dr_puesto').val(1);
                $('#txt_nomb').val('');
                $('#txt_apelli').val('');
                $('#txt_direcc').val('');
                $('#txt_telef').val('');
                $('#txt_dpi').val('');
                $('#txt_gen').val('');
                $('#txt_nacimiento').val('');
                $('#txt_FIL').val('');
                $('#txt_FI').val('');
            }
            
            $('#tbl_empleado').on('click','tr td',function(evt){
                var target,id,id_p,carne,nombres,apellidos,direccion,telefono,correo,nacimiento,inicio,ingreso;
                target = $(event.target);
                id =        target.parent().data('id');
                id_p =      target.parent().data('id_p');
                carne =     target.parent("tr").find("td").eq(0).html();
                nombres =   target.parent("tr").find("td").eq(1).html();
                apellidos = target.parent("tr").find("td").eq(2).html();
                direccion = target.parent("tr").find("td").eq(3).html();
                telefono =  target.parent("tr").find("td").eq(4).html();
                correo =    target.parent("tr").find("td").eq(5).html();
                nacimiento= target.parent("tr").find("td").eq(6).html();
                inicio =    target.parent("tr").find("td").eq(8).html();
                ingreso =   target.parent("tr").find("td").eq(9).html();
                
                $('#txt_id_emple').val(id);
                $('#txt_nomb').val(carne);
                $('#txt_apelli').val(nombres);
                $('#txt_direcc').val(apellidos);
                $('#txt_telef').val(direccion);
                $('#txt_dpi').val(telefono);
                $('#txt_gen').val(correo);           
                $('#txt_nacimiento').val(nacimiento);
                $("#dr_puesto").val(id_p);
                $('#txt_FIL').val(inicio);
                $('#txt_FI').val(ingreso);
                $("#modal_empleado").modal('show');
            });
            
            
        </script>
    
    </body>
</html>
