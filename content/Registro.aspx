<%@ Page MasterPageFile="~/shared/Layout.master" Title=".:: ASP - Formulario de Registro ::." Language="C#" AutoEventWireup="true" CodeFile="Registro.aspx.cs" Inherits="content_Registro" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentLayout" runat="Server">
    <div>&nbsp;</div>
    <div class="container">
        <asp:Panel ID="successAlert" CssClass="alert alert-dismissible alert-success hidden" runat="server">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Enviado con éxito!</strong>
            <asp:Label ID="successAlertMessage" runat="server"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="errorAlert" cssclass="alert alert-dismissible alert-danger hidden" runat="server">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Trampa!</strong>
            <asp:Label ID="errorAlertMessage" runat="server"></asp:Label>
        </asp:Panel>
    </div>
    <div class="container well">
        <form id="personDataForm" class="form-horizontal" runat="server">
            <fieldset>
                <legend>Formulario de Registro</legend>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="personFirstNameText" class="col-lg-3 control-label">Nombre:</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="personFirstNameText" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="personNameValidator"
                                ControlToValidate="personFirstNameText"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personLastNameText" class="col-lg-3 control-label">Apellidos:</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="personLastNameText" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="personLastNameValidator"
                                ControlToValidate="personLastNameText"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personTelephoneText" class="col-lg-3 control-label">Teléfono:</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="personTelephoneText" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="personTelephoneValidator"
                                ControlToValidate="personTelephoneText"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personBornCitySelect" class="col-lg-3 control-label">Ciudad de nacimiento:</label>
                        <div class="col-lg-9">
                            <asp:DropDownList ID="personBornCitySelect" class="form-control" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator
                                ID="personBornCityValidator"
                                ControlToValidate="personBornCitySelect"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="personEmailText" class="col-lg-3 control-label">Correo:</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="personEmailText" class="form-control" runat="server" autocomplete="off" type="email"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="personEmailValidator"
                                ControlToValidate="personEmailText"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personWeightText" class="col-lg-3 control-label">Peso: (Lb)</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="personWeightText" class="form-control" runat="server" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="personWeightRequiredFieldValidator"
                                ControlToValidate="personWeightText"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                            <asp:RangeValidator ID="personWeightRangeValidator"
                                ControlToValidate="personWeightText"
                                CssClass="label label-danger"
                                MinimumValue="90"
                                MaximumValue="300"
                                Type ="Double"
                                Text="El peso debe estar entre 90 y 300"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">Sexo:</label>
                        <div class="col-lg-9">
                            <div class="radio">
                                <label>
                                    <asp:RadioButtonList ID="personGenderRadio"
                                        RepeatLayout="Flow"
                                        runat="server">
                                        <asp:ListItem>Femenino</asp:ListItem>
                                        <asp:ListItem>Masculino</asp:ListItem>
                                    </asp:RadioButtonList>
                                </label>
                            </div>
                            <asp:RequiredFieldValidator
                                ID="personGenderValidator"
                                ControlToValidate="personGenderRadio"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="personHeightText" class="col-lg-3 control-label">Altura: (m)</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="personHeightText" class="form-control" runat="server" autocomplete="off"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="personHeightRequiredFieldValidator"
                                ControlToValidate="personHeightText"
                                CssClass="label label-danger"
                                Text="Campo requerido"
                                runat="server" />
                            <asp:RangeValidator ID="personHeightRangeValidatorValidator"
                                ControlToValidate="personHeightText"
                                CssClass="label label-danger"
                                MinimumValue="1"
                                MaximumValue="2.5"
                                Type ="Double"
                                Text="La altura debe estar entre 1 y 2.50"
                                runat="server" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <a href="Registro.aspx" class="btn btn-default">Cancelar</a>
                        <asp:Button ID="personDataButton" CssClass="btn btn-primary" Text="Enviar" runat="server" OnClick="personDataButton_Click" />
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</asp:Content>
