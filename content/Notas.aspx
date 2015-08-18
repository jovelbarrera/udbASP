<%@ Page MasterPageFile="~/shared/Layout.master" Title=".:: ASP - Calculador de Notas ::." Language="C#" AutoEventWireup="true" CodeFile="Notas.aspx.cs" Inherits="content_Notas" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentLayout" runat="Server">
    <div>&nbsp;</div>
    <div class="container">
        <asp:Panel ID="errorAlert" runat="server" CssClass="alert alert-dismissible alert-danger hidden">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Trampa!</strong><br />
            <asp:Label ID="errorMessage" runat="server"></asp:Label>
        </asp:Panel>
    </div>
    <div class="container well">
        <form id="gradesForm" class="form-horizontal" runat="server">
            <fieldset>
                <legend>Calculador de Notas</legend>
                <div class="col-lg-6">
                    <div class="thumbnail">
                        <asp:Image ID="studentFaceImage" runat="server" ImageUrl="~/assets/img/student-questionmark.png" alt="student-face" />
                        <div class="caption text-center">
                            <h3>
                                <asp:Label ID="studentFeedback" runat="server"></asp:Label>
                            </h3>
                            <p id="studentNameLabel"></p>
                            <p>
                                <asp:Button ID="calculateButton" CssClass="btn btn-primary" runat="server" Text="Calcular mi aflicción" OnClick="calculateButton_Click"></asp:Button>
                                <a href="Notas.aspx" class="btn btn-default">Borrar evidencia</a>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="form-group">
                        <label for="studentName" class="col-lg-3 control-label">Tu nombre:</label>
                        <div class="col-lg-9">
                            <asp:TextBox ID="studentNameText" runat="server" CssClass="form-control studentNameText" autocomplete="off" placeholder="Hola!"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="studentNameValidator"
                                ControlToValidate="studentNameText"
                                CssClass="label label-danger"
                                Text="Necesito tu nombre"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="firstGrade" class="col-lg-3 control-label">Nota 1:</label>
                        <div class="col-lg-6">
                            <asp:TextBox ID="firstGradeText" runat="server" CssClass="form-control" autocomplete="off" placeholder="Primer periodo"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="firstGradeValidator" ControlToValidate="firstGradeText" CssClass="label label-danger" Text="Si no tienes nota pon 0" runat="server" />
                        </div>
                        <div class="col-lg-3">
                            <div class="input-group">
                                <asp:TextBox ID="firstGradePercentageText" runat="server" CssClass="form-control firstGradePercentageText" autocomplete="off">0</asp:TextBox>
                                <span class="input-group-addon">%</span>
                            </div>
                            <asp:RangeValidator
                                ID="firstGradePercentageValidator"
                                ControlToValidate="firstGradePercentageText"
                                MinimumValue="1"
                                MaximumValue="50"
                                Type="Double"
                                CssClass="label label-danger"
                                Text="Dame la ponderación"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="secondGrade" class="col-lg-3 control-label">Nota 2:</label>
                        <div class="col-lg-6">
                            <asp:TextBox ID="secondGradeText" runat="server" CssClass="form-control" autocomplete="off" placeholder="Segundo periodo"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="secondGradeValidador"
                                ControlToValidate="secondGradeText"
                                CssClass="label label-danger"
                                Text="Si no tienes nota pon 0"
                                runat="server" />
                        </div>
                        <div class="col-lg-3">
                            <div class="input-group">
                                <asp:TextBox ID="secondGradePercentageText" runat="server" CssClass="form-control secondGradePercentageText" autocomplete="off">0</asp:TextBox>
                                <span class="input-group-addon">%</span>
                            </div>
                            <asp:RangeValidator
                                ID="secondGradePercentageValidator"
                                ControlToValidate="secondGradePercentageText"
                                MinimumValue="1"
                                MaximumValue="50"
                                Type="Double"
                                CssClass="label label-danger"
                                Text="Dame la ponderación"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="thirdGrade" class="col-lg-3 control-label">Nota 3:</label>
                        <div class="col-lg-6">
                            <asp:TextBox ID="thirdGradeText" runat="server" CssClass="form-control" autocomplete="off" placeholder="Tercer periodo"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="thirdGradeTextValidator"
                                ControlToValidate="thirdGradeText"
                                CssClass="label label-danger"
                                Text="Si no tienes nota pon 0"
                                runat="server" />
                        </div>
                        <div class="col-lg-3">
                            <div class="input-group">
                                <asp:TextBox ID="thirdGradePercentageText" runat="server" CssClass="form-control thirdGradePercentageText" autocomplete="off">0</asp:TextBox>
                                <span class="input-group-addon">%</span>
                            </div>
                            <asp:RangeValidator
                                ID="thirdGradePercentageValidator"
                                ControlToValidate="thirdGradePercentageText"
                                MinimumValue="1"
                                MaximumValue="50"
                                Type="Double"
                                CssClass="label label-danger"
                                Text="Dame la ponderación"
                                runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-3 pull-right">
                            <div class="input-group">
                                <input type="text" id="currentPercentage" class="form-control" disabled="disabled" value="0" />
                                <span class="input-group-addon">%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
    <script>
        $(document).ready(function () {
            $(document).on("keyup", ".studentNameText", function () { displayStudentName(this) });
            $(document).on("keyup", ".firstGradePercentageText", function () { updateCurrentPercentage() });
            $(document).on("keyup", ".secondGradePercentageText", function () { updateCurrentPercentage() });
            $(document).on("keyup", ".thirdGradePercentageText", function () { updateCurrentPercentage() });
            //$("#studentNameText").keyup(function () { displayStudentName(this) });
            //$("#firstGradePercentageText").keyup(function () { updateCurrentPercentage() });
            //$("#secondGradePercentageText").keyup(function () { updateCurrentPercentage() });
            //$("#thirdGradePercentageText").keyup(function () { updateCurrentPercentage() });

            displayStudentName = function (element) {
                $("#studentNameLabel").text("Hola! " + $(element).val());
            };
            updateCurrentPercentage = function () {                
                $("#currentPercentage").val(
                    (parseFloat($(".firstGradePercentageText").val()) +
                    parseFloat($(".secondGradePercentageText").val()) +
                    parseFloat($(".thirdGradePercentageText").val())).toString()
                    );
            };
        });
    </script>
</asp:Content>
