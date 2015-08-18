<%@ Page MasterPageFile="~/shared/Layout.master" Title=".:: ASP - Guias 1 y 2 ::." Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentLayout" runat="Server">
    <div>&nbsp;</div>
    <div class="container">
        <h1>
            <img src="<%= ResolveClientUrl("~/assets/img/jovelbarrera.jpg") %>" alt="Jovel Barrera" class="img-circle" width="50" />
            Roberto Jovel
        </h1>
        <h3>JB090575 - ASP Lab</h3>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-guia1" data-toggle="tab">Guía 1</a></li>
            <li><a href="#tab-guia2" data-toggle="tab">Guía 2</a></li>
            <%--<li><a href="#tab-guia3" data-toggle="tab">Guía 3</a></li>--%>
        </ul>
        <div id="tabContent" class="tab-content">
            <div class="tab-pane fade active in" id="tab-guia1">
                <h3>Guia 1</h3>
                <ol>
                    <li>
                        <strong>Cree una calculadora que sume, reste, múltiple o divida dos números, si el divisor es 0 que no haga la operación.</strong>
                        <p>
                            Es el ejercicio <a href="<%= ResolveClientUrl("~/content/Calculadora.aspx") %>">Calculadora</a>
                        </p>
                    </li>
                    <li>
                        <strong>Cree un formulario WEB donde un estudiante pueda colocar sus notas, tres en total y que puede obtener un promedio, si la nota es 10 que lo felicite, si es menor que 10 pero 7 o mayor, que le coloque aprobado, si es menor que 7 coloque aplazado y a los de 4 para abajo, sugerir que visite al tutor.</strong>
                        <p>
                            Es el ejercicio <a href="<%= ResolveClientUrl("~/content/Notas.aspx") %>">Notas</a>
                        </p>
                    </li>
                    <li>
                        <strong>Crear un ejemplo usando otros controles WEB, como por ejemplo, listbox, Radiobutton, Drowdownlist.</strong>
                        <p>
                            Aplicado en el ejercicio del <a href="<%= ResolveClientUrl("~/content/Registro.aspx") %>">Formulario de Registro</a>
                        </p>
                    </li>
                    <li>
                        <strong>Elaborar un formulario de registro que me pida los datos completos de una persona, nombres, apellidos, teléfono, ciudad de nacimiento, correo, peso, sexo y estatura, usando varios controles web.</strong>
                        <p>
                            Es el ejercicio <a href="<%= ResolveClientUrl("~/content/Registro.aspx") %>">Registro</a>
                        </p>
                    </li>
                    <li>
                        <strong>Elabore un ejemplo aplicando la opción page_load, según ejemplo.</strong>
                        <p>
                            Aplicado en el ejercicio del <a href="<%= ResolveClientUrl("~/content/Registro.aspx") %>">Formulario de Registro</a>
                        </p>
                    </li>
                    <li>
                        <strong>Cree un script que alimente a un listbox, a partir de un formulario de ASP.NET.</strong>
                        <p>
                            Aplicado en el ejercicio del <a href="<%= ResolveClientUrl("~/content/Registro.aspx") %>">Formulario de Registro</a>
                        </p>
                    </li>
                    <li>
                        <strong>Elabore script con los diferentes controles de validación.</strong>
                        <p>
                            Aplicado en el ejercicio del <a href="<%= ResolveClientUrl("~/content/Notas.aspx") %>">Calculador de Notas</a> y <a href="<%= ResolveClientUrl("~/content/Registro.aspx") %>">Formulario de Registro</a>
                        </p>
                    </li>
                    <li>
                        <strong>Pruebe los controles de validación de HTML5.</strong>
                        <p>
                            Aplicado en el ejercicio del <a href="<%= ResolveClientUrl("~/content/Registro.aspx") %>">Formulario de Registro</a>
                        </p>
                    </li>
                </ol>
            </div>
            <div class="tab-pane fade" id="tab-guia2">
                <h3>Guia 2</h3>
                <ol>
                    <li>
                        <strong>Cree un Master Page con un diseño con imágenes de internet y cree 3 formularios aplicando validación y que uno de ellos se puedan subir imágenes.</strong>
                        <p>                            
                        </p>
                    </li>
                    <li>
                        <strong>Cree un Master Page usando sola barra vertical izquierda, y también cree 3 formularios aplicando todo lo aprendido hasta hoy.</strong>
                        <p>                            
                        </p>
                    </li>
                    <li>
                        <strong>En ambos incluya también un menú.</strong>
                        <p>                            
                        </p>
                    </li>
                    <li>
                        <strong>Cree un Master Page, donde el menú este compuesto de imágenes y no menú para seleccionar formularios.</strong>
                        <p>                            
                        </p>
                    </li>
                </ol>
            </div>
            <div class="tab-pane fade" id="tab-guia3">
                <h3>Guia 3</h3>
                <ol>
                    <li>
                        <strong>Cree otro ejemplo usando tres GridView.</strong>
                        <p>                            
                        </p>
                    </li>
                    <li>
                        <strong>Combine otros controles con un GridView como gráficos, detalles y otros.</strong>
                        <p>                            
                        </p>
                    </li>
                    <li>
                        <strong>Realice ejemplos con las dos bases de datos proporcionadas.</strong>
                        <p>                            
                        </p>
                    </li>
                </ol>
            </div>
        </div>
    </div>
    <div>&nbsp;</div>
</asp:Content>