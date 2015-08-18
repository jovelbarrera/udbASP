using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class content_Notas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void calculateButton_Click(object sender, EventArgs e)
    {
        float promedio = 0;
        float p, p1, p2, p3, n1, n2, n3;

        if (float.TryParse(firstGradeText.Text, out p))
        {
            n1 = p;
        }
        else
        {
            errorMessage.Text = "Revisa la nota del primer periodo, debe estar entre 0 y 10";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }

        if (float.TryParse(secondGradeText.Text, out p))
        {
            n2 = p;
        }
        else
        {
            errorMessage.Text = "Revisa la nota del segundo periodo, debe estar entre 0 y 10";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }
        if (float.TryParse(thirdGradeText.Text, out p))
        {
            n3 = p;
        }
        else
        {
            errorMessage.Text = "Revisa la nota del tercer periodo, debe estar entre 0 y 10";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }


        if (float.TryParse(firstGradePercentageText.Text, out p))
        {
            p1 = p;
        }
        else
        {
            errorMessage.Text = "Revisa la ponderación del primer periodo, debe estar entre 1 y 50";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }

        if (float.TryParse(secondGradePercentageText.Text, out p))
        {
            p2 = p;
        }
        else
        {
            errorMessage.Text = "Revisa la ponderación del segundo periodo, debe estar entre 1 y 50";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }
        if (float.TryParse(thirdGradePercentageText.Text, out p))
        {
            p3 = p;
        }
        else
        {
            errorMessage.Text = "Revisa la ponderación del tercer periodo, debe estar entre 1 y 50";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }

        if (!(n1 >= 0 && n1 <= 10 && n2 >= 0 && n2 <= 10 && n3 >= 0 && n3 <= 10))
        {
            errorMessage.Text = "Las notas debe estar entre 0 y 10";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }

        if ((p1 + p2 + p3) != 100)
        {
            errorMessage.Text = "Las ponderaciones deben sumar 100";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }

        promedio = n1 * p1 / 100 + n2 * p2 / 100 + n3 * p3 / 100;
        studentFeedback.Text = "Tu promedio es de " + promedio.ToString() + ", ";
        if (promedio == 10)
        {
            studentFaceImage.ImageUrl = "~/assets/img/student-happy.png";
            studentFaceImage.AlternateText = "student-pleasant";
            studentFeedback.Text += "Felicidades " + studentNameText.Text;
        }
        else if (promedio >= 7)
        {
            studentFaceImage.ImageUrl = "~/assets/img/student-pleasant.png";
            studentFaceImage.AlternateText = "student-happy";
            studentFeedback.Text += "Bien hecho " + studentNameText.Text + " sigue esforzandote!";
        }
        else if (promedio > 4)
        {
            studentFaceImage.ImageUrl = "~/assets/img/student-sad.png";
            studentFaceImage.AlternateText = "student-sad";
            studentFeedback.Text += studentNameText.Text + " Has reprobado el ciclo";
        }
        else if (promedio <= 4)
        {
            studentFaceImage.ImageUrl = "~/assets/img/student-helpneeded.png";
            studentFaceImage.AlternateText = "student-helpneeded";
            studentFeedback.Text += "Es tiempo que visites a tu tutor " + studentNameText.Text;
        }
        
    }
}