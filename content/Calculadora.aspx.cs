using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class content_Calculadora : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void validate(object sender, EventArgs e)
    {
        double n1 = 0, n2 = 0, firstNumber, secondNumber;
        var response = string.Empty;
        var error = true;
        var incomplete = false;
        string operatorSymbol = string.Empty;

        if (string.IsNullOrEmpty(firstNumberText.Value) || string.IsNullOrWhiteSpace(firstNumberText.Value))
            firstNumberText.Value = "0";
        if (string.IsNullOrEmpty(secondNumberText.Value) || string.IsNullOrWhiteSpace(secondNumberText.Value))
            secondNumberText.Value = "0";

        if (double.TryParse(firstNumberText.Value, out firstNumber))
        {
            n1 = firstNumber;
            if (double.TryParse(secondNumberText.Value, out secondNumber))
            {
                n2 = secondNumber;
                error = false;
                operatorSymbol = operationText.Value;
                switch (operatorSymbol)
                {
                    case "+":
                        response = (n1 + n2).ToString();
                        break;
                    case "-":
                        response = (n1 - n2).ToString();
                        break;
                    case "*":
                        response = (n1 * n2).ToString();
                        break;
                    case "/":
                        if (n2 != 0)
                            response = (n1 / n2).ToString();
                        else
                        {
                            response = "División entre 0";
                            error = true;
                        }
                        break;
                    default:
                        incomplete = true;
                        response = n1.ToString();
                        break;
                }
            }
            else
            {
                response = secondNumberText.Value + " no es un número válido.";
            }
        }
        else
        {
            response = firstNumberText.Value + " no es un número válido.";
        }
        resetCalculator();
        if (error)
        {
            currentOperationText.Text = "Error: " + response;
        }
        else
        {
            if (string.IsNullOrEmpty(response))
                currentOperationText.Text = "0";
            else if (incomplete)
                currentOperationText.Text = response;
            else
                currentOperationText.Text = n1.ToString() + " " + operatorSymbol + " " + n2.ToString() + " = " + response;
            displayText.Text = response;
            firstNumberText.Value = response;
        }
    }

    protected void resetCalculator()
    {
        firstNumberText.Value = string.Empty;
        secondNumberText.Value = string.Empty;
        operationText.Value = string.Empty;
        displayText.Text = string.Empty;
    }
}