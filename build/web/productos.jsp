<%-- 
    Document   : productos
    Created on : 24 oct 2022, 16:05:44
    Author     : Gustavo
--%>

<%@page session="true" %>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap" %>
<%@page import="modelo.Marca" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="modelo.Producto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Productos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
        
        <div class="modal fade" id="modal_marca">
        <div class="modal-dialog">
        <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Formulario Marcas</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          
           <form action="sr_marca" method="post" class="form-group">
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Id marca</span>
                <input type="text" name="txt_idmarca" id="txt_idmarca" value ="0" class="form-control" placeholder="0" aria-label="Puesto" aria-describedby="addon-wrapping" readonly>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Marca</span>
                <input type="text" name="txt_marca" id="txt_marca" class="form-control" placeholder="Marca" aria-label="Puesto" aria-describedby="addon-wrapping" required>
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
        <h1>Productos</h1>
        <div class="container mt-3">
        <div class="modal fade" id="modal_producto">
        <div class="modal-dialog">
      <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Formulario Productos</h4>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
                  <form action="sr_producto" method="post" class="form-group">
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Id producto</span>
                <input type="text" name="txt_id" id="txt_id" value="0" class="form-control" placeholder="0" aria-label="Puesto" aria-describedby="addon-wrapping" readonly>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Producto</span>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Zapato" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Marca</span>
                <select id="numbers" onchange="myFunction()" name="dr_marca" id="dr_marca" class="form-control">
                    <% Marca puesto = new Marca();
                HashMap<String,String> drop = puesto.drop_marca();
                    for(String i : drop.keySet()){
                    out.println("<option value='" + i +"'>" + drop.get(i) + "</option>");
                    }
                %>
                <option value="?">+agregar marca</option>
                </select>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Descripcion</span>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Tenis" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Imagen</span>
                <input type="text" name="txt_imagen" id="txt_imagen" class="form-control" placeholder="Url" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Precio Costo</span>
                <span class="input-group-text" id="addon-wrapping">Q</span>
                <input type="text" name="txt_PrecioCosto" id="txt_PrecioCosto" class="form-control" placeholder="xx.xx" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Precio Venta</span>
                <span class="input-group-text" id="addon-wrapping">Q</span>
                <input type="text" name="txt_PrecioVenta" id="txt_PrecioVenta" class="form-control" placeholder="xx.xx" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Existencia</span>
                <input type="text" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="10" aria-label="Puesto" aria-describedby="addon-wrapping" required>
            </div>
            <br>
            <div class="input-group flex-nowrap">
                <span class="input-group-text" id="addon-wrapping">Fecha de ingreso</span>
                <input type="datetime-local" name="txt_Fningreso" id="txt_Fningreso" class="form-control" placeholder="dd/mm/yyyy" aria-label="Puesto" aria-describedby="addon-wrapping" required>
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
             <table class="table table-dark table-hover">
                <thead class="table-success">
                <tr>
                    <th>Producto</th>
                    <th>Marca</th>
                    <th>Descripcion</th>
                    <th>Imagen</th>
                    <th>Precio_Costo</th>
                    <th>Precio_venta</th>
                    <th>Existencia</th>
                    <th>Fecha_ingreso</th>
                    
               
                </tr>
                </thead>
                <tbody id="tbl_producto">
                
                       <% Producto empleado = new Producto();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = empleado.leer();
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0)+" data-id_p=" + tabla.getValueAt(t, 9)+">");
                            out.println("<td>"+ tabla.getValueAt (t,1) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,9) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,3) + "</td>");
                            out.println("<td><img src='"+ tabla.getValueAt (t,4) + "'heigth=25% width=25%/></td>");
                            out.println("<td>"+ tabla.getValueAt (t,5) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,6) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,7) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,8) + "</td>");
                            out.println("</tr>");
                        }
                  %>
                      
                </tbody>
                
            </table>
            
            
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_producto" onclick="limpiar()">Nuevo Registro</button>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function myFunction() {
            var option_value = document.getElementById("numbers").value;
            if (option_value === "?") {
              //  alert("Hai !");
               $("#modal_marca").modal();
               $("#modal_producto").close();
             }
            }
             function limpiar(){
                $('#txt_id').val(0);
                $('#dr_marca').val(1);
                $('#txt_producto').val('');
                $('#txt_descripcion').val('');
                $('#txt_imagen').val('');
                $('#txt_PrecioCosto').val('');
                $('#txt_PrecioVenta').val('');
                $('#txt_existencia').val('');
                $('#txt_Fningreso').val('');

            }
            
            $('#tbl_producto').on('click','tr td',function(evt){
                var target,id,id_p,producto,idmarca,descripcion,imagen,precio_costo,precio_venta,existencia,fecha_ingreso;
                target = $(event.target);
                id =        target.parent().data('id');
                id_p =      target.parent().data('id_p');
                producto =     target.parent("tr").find("td").eq(0).html();
                idmarca =   target.parent("tr").find("td").eq(1).html();
                descripcion = target.parent("tr").find("td").eq(2).html();
                imagen = target.parent("tr").find("td").eq(3).html();
                precio_costo =  target.parent("tr").find("td").eq(4).html();
                precio_venta =    target.parent("tr").find("td").eq(5).html();
                existencia= target.parent("tr").find("td").eq(6).html();
                fecha_ingreso =    target.parent("tr").find("td").eq(7).html();
                
                $('#txt_id').val(id);
                $('#txt_producto').val(producto);
                $('#dr_marca').val(id_p);
                $('#txt_descripcion').val(descripcion);
                $('#txt_imagen').val(imagen);
                $('#txt_PrecioCosto').val(precio_costo);
                $('#txt_PrecioVenta').val(precio_venta);           
                $('#txt_existencia').val(existencia);
                $("#txt_Fningreso").val(fecha_ingreso);
                $("#modal_producto").modal('show');
            });
            
            
            
        </script>
    </body>
</html>