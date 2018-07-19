﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cadastrar.aspx.cs" Inherits="wwwroot.usuario.cadastrar" MasterPageFile="~/Master.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style>
        .form-control {
            width: 100% !important
        }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="body">
    <fieldset>
        <legend>Informações pessoais</legend>
        <div class="form-group ">
            <div class="form-inline ">
                <label class="col-sm-1" for="txtNome">Nome*</label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNome" />
                    <asp:RequiredFieldValidator ErrorMessage="Nome" ControlToValidate="txtNome" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" />
                </div>
                <label for="txtSobreNome" class="col-2">Sobrenome*</label>
                <div class=" col-md-5">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtSobreNome" />
                    <asp:RequiredFieldValidator ErrorMessage="Sobre Nome" ControlToValidate="txtSobreNome" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-inline">
                <label class="col-sm-1" for="txtCPF">CPF*</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" CssClass="form-control cpf" ID="txtCPF" />
                    <asp:RequiredFieldValidator ErrorMessage="CPF" ControlToValidate="txtCPF" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" />
                </div>
                <label class="col-sm-1" for="txtRG">RG*</label>
                <div class="col-md-5">
                    <asp:TextBox runat="server" CssClass="form-control rg" ID="txtRG" />
                    <asp:RequiredFieldValidator ErrorMessage="CPF" ControlToValidate="txtRG" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" />
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>Endereco</legend>
        <div class="form-group">
            <div class="form-inline">
                <label class="col-sm-1" for="txtCep">Cep*</label>
                <div class="col-md-3 ">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtCep" />
                    <asp:RequiredFieldValidator ErrorMessage="CEP" ControlToValidate="txtCep" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" />
                </div>
                <label class="col-sm-1" for="txtEndereco">Endereço</label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEndereco" />
                </div>
                <label class="col-sm-1" for="txtnumero">Nº*</label>
                <div class="col-md-2">
                    <asp:TextBox runat="server" CssClass="form-control numero" ID="txtnumero" />
                    <asp:RequiredFieldValidator ErrorMessage="Numero da casa" ControlToValidate="txtnumero" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" />
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>Contato</legend>
        <div class="form-group">
            <div class="form-inline">
                <label class="col-sm-1" for="txtTelefone">Telefone</label>
                <div class="col-md-2">
                    <asp:TextBox runat="server" CssClass="form-control tel" ID="txtTelefone" />
                </div>
                <label for="txtCel" class="col-sm-1">Celular</label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" CssClass="form-control cel" ID="txtCel" />
                </div>
                <label class="col-sm-1" for="txtEmail">Email*</label>
                <div class="col-md-4">
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" TextMode="Email" />
                    <asp:RequiredFieldValidator ControlToValidate="txtEmail" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" BorderColor="Red" />
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset>
        <legend>Acesso</legend>
        <div class="form-group">
            <div class="form-inline">

                <div class="col-md-3">
                    Login*
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtLogin" />
                    <asp:RegularExpressionValidator ValidationExpression="^\d{4,8}$" ErrorMessage="O login deve conter de 4 a caracteres 8 " ControlToValidate="txtLogin" runat="server" ValidationGroup="validation" Display="None" />
                </div>

                <div class="col-md-3">Senha*<asp:TextBox runat="server" CssClass="form-control" ID="txtSenha" TextMode="Password" /></div>
                <asp:RegularExpressionValidator ValidationExpression="^\d{4,8}$" ErrorMessage="senha deve conter de 4 a caracteres 8" ForeColor="Red" Display="None" ControlToValidate="txtSenha" runat="server" ValidationGroup="validation" />
                <asp:RequiredFieldValidator ErrorMessage="Senha" ControlToValidate="txtSenha" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" BorderColor="Red" />
                <asp:CompareValidator ErrorMessage="As senhas não conferem " ControlToValidate="txtSenha" runat="server" ControlToCompare="txtSenha2" ValidationGroup="validation" Display="None" />

                <div class="col-md-3">Repita a senha<asp:TextBox runat="server" CssClass="form-control" ID="txtSenha2" TextMode="Password" /></div>
                <asp:RequiredFieldValidator ErrorMessage="Re-Senha" ControlToValidate="txtSenha2" runat="server" ForeColor="Red" Display="None" ValidationGroup="validation" BorderColor="Red" />
                <asp:Panel runat="server" ID="pnlTipoUsuario" Visible="false">
                    <asp:DropDownList runat="server" ID="ddlTipo">
                        <asp:ListItem Text="Usuario" Value="0" />
                        <asp:ListItem Text="Medico ou Dentista" Value="1" />
                    </asp:DropDownList>
                </asp:Panel>
            </div>
        </div>
    </fieldset>
    <asp:ValidationSummary runat="server" ValidationGroup="validation" ForeColor="Red" HeaderText="Campos invalidos" />
    <asp:Button Text="Salvar" runat="server" ID="btnSalvar" OnClick="btnSalvar_Click" ValidationGroup="validation" CssClass="btn btn-success" />
    <script src="/scripts/jquery.mask.min.js"></script>
    <script>
        $(function () {
            $('.cpf').mask('000.000.000-00');
            $('.rg').mask('00.000.000-00');

            $('.numero').mask('0000');
            $('.tel').mask('(00) 0000-0000');
            $('.cel').mask('(00) 00000-0000');
        });
    </script>
</asp:Content>