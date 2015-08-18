<%@ Page MasterPageFile="~/shared/Layout.master" Title=".:: ASP - Calculadora ::." Language="C#" AutoEventWireup="true" CodeFile="Calculadora.aspx.cs" Inherits="content_Calculadora" %>

<asp:Content ID="Content2" ContentPlaceHolderID="contentLayout" runat="Server">
    <div>&nbsp;</div>
    <div class="container">
        <div class="col-lg-8 col-lg-offset-2 well">
            <form id="calculatorForm" class="form-horizontal" runat="server">
                <fieldset>
                    <legend>Calculadora</legend>

                    <div class="col-lg-6">
                        <div class="form-group-vertical">
                            <asp:TextBox ID="displayText" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                            <asp:HiddenField ID="firstNumberText" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="secondNumberText" runat="server"></asp:HiddenField>
                            <asp:HiddenField ID="operationText" runat="server"></asp:HiddenField>
                            <asp:TextBox ID="currentOperationText" runat="server" CssClass="form-control" disabled="disabled"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <div class="btn-group-vertical">
                                <button id="n7" class="btn btn-default cal-constant" value="7">7</button>
                                <button id="n4" class="btn btn-default cal-constant" value="4">4</button>
                                <button id="n1" class="btn btn-default cal-constant" value="1">1</button>
                                <button id="n0" class="btn btn-default cal-constant" value="0">0</button>
                            </div>
                            <div class="btn-group-vertical">
                                <button id="n8" class="btn btn-default cal-constant" value="8">8</button>
                                <button id="n5" class="btn btn-default cal-constant" value="5">5</button>
                                <button id="n2" class="btn btn-default cal-constant" value="2">2</button>
                                <button id="dec" class="btn btn-default cal-constant" value=".">.</button>
                            </div>
                            <div class="btn-group-vertical">
                                <button id="n9" class="btn btn-default cal-constant" value="9">9</button>
                                <button id="n6" class="btn btn-default cal-constant" value="6">6</button>
                                <button id="n3" class="btn btn-default cal-constant" value="3">3</button>
                                <button id="pi" class="btn btn-default cal-constant" value="3.141592654">&pi;</button>
                            </div>

                            <div class="btn-group-vertical">
                                <button id="del" class="btn btn-default cal-constant">del</button>
                                <button id="mul" class="btn btn-default cal-operator" value="*">*</button>
                                <button id="add" class="btn btn-default cal-operator" value="+">+</button>
                                <button id="sng" class="btn btn-default cal-constant">-/+</button>
                            </div>

                            <div class="btn-group-vertical">
                                <button id="clr" class="btn btn-default cal-constant">clr</button>
                                <button id="div" class="btn btn-default cal-operator" value="/">/</button>
                                <button id="sub" class="btn btn-default cal-operator" value="-">-</button>
                                <asp:Button ID="operate" runat="server" CssClass="btn btn-default" Text="=" OnClick="validate"></asp:Button>
                            </div>
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $("#<%=displayText.ClientID%>").focus();
            $(".cal-constant").click(function () { calConstant(this) });
            $(".cal-operator").click(function () { calOperator(this) });
            $("#<%=displayText.ClientID%>").keyup(function () { writeInputs(event) });

            calConstant = function (button) {
                event.preventDefault();
                $("#<%=displayText.ClientID%>").val(currentNumber(button));
                $("#<%=displayText.ClientID%>").focus();
                writeInputs(event);
            };
            calOperator = function (button) {
                event.preventDefault();
                defineOperation($(button).val())
                updateCurrentOperation();
            };
            currentNumber = function (button) {
                var prevValue = $("#<%=displayText.ClientID%>").val();
                if ($(button).attr("id") == "pi") {
                    return $(button).val();
                } else if ($(button).attr("id") == "sng") {
                    return prevValue.charAt(0) == "-" ? prevValue.replace('-', '') : "-" + prevValue;
                } else if ($(button).attr("id") == "del") {
                    return prevValue.substring(0, prevValue.length - 1);
                } else if ($(button).attr("id") == "clr") {
                    resetCalculator();
                    return "";
                } else {
                    return prevValue + $(button).val();
                }
            };
            defineOperation = function (symbol) {
                if ($("#<%=firstNumberText.ClientID%>").val() != "") {
                    $("#<%=operationText.ClientID%>").val(symbol);
                    $("#<%=displayText.ClientID%>").val("");
                    updateCurrentOperation();
                }
            };
            writeInputs = function (event) {
                var prevValue = $("#<%=displayText.ClientID%>").val();
                //alert(String.fromCharCode(event.keyCode));
                switch (event.keyCode) {
                    case 107:
                        defineOperation("+");
                        break;
                    case 109:
                        defineOperation("-");
                        break;
                    case 106:
                        defineOperation("*");
                        break;
                    case 111:
                        defineOperation("/");
                        break;
                    default:
                        if ($("#<%=operationText.ClientID%>").val() == "") {
                            $("#<%=firstNumberText.ClientID%>").val(prevValue);
                        } else {
                            $("#<%=secondNumberText.ClientID%>").val(prevValue);
                        }
                        break;
                }
                updateCurrentOperation();
                //$("#operationText").val($(button).val());
                //$("#displayText").val("");
            };
            updateCurrentOperation = function () {
                $("#<%=currentOperationText.ClientID%>").val($("#<%=firstNumberText.ClientID%>").val() + " " +
                    $("#<%=operationText.ClientID%>").val() + " " + $("#<%=secondNumberText.ClientID%>").val());
                $("#<%=displayText.ClientID%>").focus();
            };
            resetCalculator = function () {
                $("#<%=displayText.ClientID%>").val("");
                $("#<%=firstNumberText.ClientID%>").val("");
                $("#<%=secondNumberText.ClientID%>").val("");
                $("#<%=operationText.ClientID%>").val("");
                updateCurrentOperation();
            };
        });
    </script>
</asp:Content>
