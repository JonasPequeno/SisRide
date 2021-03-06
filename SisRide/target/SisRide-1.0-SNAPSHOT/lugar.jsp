<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.ifpb.sisride.modelo.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    Usuario atual = (Usuario) session.getAttribute("usuario");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <link rel="stylesheet" href="CSS/app.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8"/>

        <title>SisRIde - Lugares</title>
    </head>
    <body>

        <%@include file="menu.jsp"%>

        <table>
            <tr>
                <td width="50%">
            <center>    
                <form method="post" action="front"  class="col s12 l4">
                    <h4>Cadastrar lugar</h4><br>
                    <div class="row">
                        <div  class="input-field col l4  offset-l4">

                            <input type="text" name="nome" placeholder="Nome do lugar" class="validate"><br>
                            <input type="number" name="numero" placeholder="Número" class="validate" min="0"><br>
                            <input type="text" name="rua" placeholder="Rua" class="validate"><br>
                            <input type="text" name="cidade" placeholder="Cidade" class="validate"><br>
                            <input type="hidden" name="command" value="CadastroLugar"/>
                            <input type="text" name="estado" placeholder="Estado" class="validate"><br>
                            <textarea placeholder="Descrição do lugar" name="descricao" 
                                      rows="5" class="validate materialize-textarea""></textarea><br><br>
                            <button type="submit" class="waves-effect waves-light btn s12">Cadastrar</button>
                        </div>
                    </div>
                </form>
            </center>
        </td>
        <td width="50%">
            <h4 align="top">Lugares cadastrados por mim </h4>
            <br>
            <table class="highlight bordered centered responsive-table">
                <tr>
                    <td><b>Nome</b></td>
                    <td><b>Descrição</b></td>
                </tr>
                <c:forEach var="lugar" items="${MeusLugares}">
                    <tr onclick="armazenarId(this.id)" id="${lugar.identificacao}"> 
                        <td> ${lugar.nome}</td>
                        <td>${lugar.descricao}</td>
                    </tr>
                </c:forEach>
            </table><br>
        <center>
            <div>

                <button class="waves-effect waves-light btn s12">Atualizar um lugar</button>
                <label>       </label>
                <button class="waves-effect waves-light btn s12" onclick="deletarLugar()">Deletar lugar</button>
            </div>
        </center>
    </td>
</tr>
</table>
</body>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="JS/app.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    var erro = "${param.erroCadastroLugar}";
    if(erro == "1"){
        swal("Erro!","Preencha todos os campos","error");
    }
    
    var mensagem = "${param.mensagem}";
    if(mensagem == "1"){
        swal("Parabéns!","O lugar foi cadastrado com sucesso","success");
    }
    if(mensagem == "2"){
        swal("OK!","O lugar foi deletado com sucesso","success");
    }
</script>
</html>
