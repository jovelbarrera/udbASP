using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class content_SubirImagen : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var bornCities = new ListItemCollection()
        {
            "",
            "San Salvador",
            "Aguilares",
            "Apopa",
            "Ayutuxtepeque",
            "Cuscatancingo",
            "Delgado",
            "El Paisnal",
            "Guazapa",
            "Ilopango",
            "Mejicanos",
            "Nejapa",
            "Panchimalco",
            "Rosario de Mora",
            "San Marcos",
            "San Martín",
            "Santiago Texacuangos",
            "Santo Tomás",
            "Soyapango",
            "Tonacatepeque",
                    };
        personBornCitySelect.DataSource = bornCities;
        if (!Page.IsPostBack)
        {
            personBornCitySelect.DataBind();
        }
    }
    protected void personDataButton_Click(object sender, EventArgs e)
    {
        errorAlert.CssClass = errorAlert.CssClass + " hidden";
        successAlert.CssClass = successAlert.CssClass + " hidden";
        var firstname = personFirstNameText.Text;
        var lastname = personLastNameText.Text;
        var phone = personTelephoneText.Text;
        var cityIndex = personBornCitySelect.SelectedIndex;
        var cityItem = personBornCitySelect.SelectedItem;
        var cityVal = personBornCitySelect.SelectedValue;
        var email = personEmailText.Text;
        var weight = personWeightText.Text;
        var genderIndex = personGenderRadio.SelectedIndex;
        var genderItem = personGenderRadio.SelectedItem;
        var genderVal = personGenderRadio.SelectedValue;
        var height = personHeightText.Text;

        if (!validator("name", firstname))
        {
            errorAlertMessage.Text = "<br/ >Los nombres no son válidos";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }
        if (!validator("name", lastname))
        {
            errorAlertMessage.Text = "<br/ >Los apellidos no son válidos";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }
        if (!validator("phone", phone))
        {
            errorAlertMessage.Text = "<br/ >El número de telefono no es válido";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }
        if (!validator("email", email))
        {
            errorAlertMessage.Text = "<br/ >El email no es válido";
            errorAlert.CssClass = errorAlert.CssClass.Replace("hidden", "").Trim();
            return;
        }
        var successPhotoUpload = uploadFile();
        successAlertMessage.Text =
            "<br /><strong>Nombre: </strong>" + firstname + " " + lastname + "<br />"
            + "<strong>Teléfono: </strong>" + phone + "<br />"
            + "<strong>Ciudad de Nacimiento: </strong>" + cityVal + " ( Item: " + cityItem + " - Index: " + cityIndex + ")<br />"
            + "<strong>Email: </strong>" + email + "<br />"
            + "<strong>Peso: </strong>" + weight + "<br />"
            + "<strong>Sexo: </strong>" + genderVal + " ( Item: " + genderItem + " - Index: " + genderIndex + ")<br />"
            + "<strong>Altura: </strong>" + height + "<br />"
            + "<strong>Fotografía: </strong>" + (successPhotoUpload ? "Sí, en la ruta '~/Uploads/'" : "No");

        successAlert.CssClass = successAlert.CssClass.Replace("hidden", "").Trim();
    }

    private bool validator(string type, string str)
    {
        switch (type)
        {
            case "name":
                var nameAllowedRegEx = new Regex(@"^[a-zA-Z''-'\s]{1,40}$", RegexOptions.Compiled);
                return !string.IsNullOrEmpty(str) && nameAllowedRegEx.IsMatch(str);
            case "phone":
                var phoneAllowedRegEx = new Regex(@"^[27](\d{7}|\d{3}-\d{4}|\d{3}\s\d{4})$", RegexOptions.Compiled);
                return !string.IsNullOrEmpty(str) && phoneAllowedRegEx.IsMatch(str);
            case "email":
                var emailAllowedRegEx = new Regex(@"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$", RegexOptions.Compiled);
                return !string.IsNullOrEmpty(str) && emailAllowedRegEx.IsMatch(str);
            default:
                return false;
        }
    }
    public bool uploadFile()
    {
        if (personPhotoFile.HasFile)
            try
            {
                personPhotoFile.SaveAs(Server.MapPath("~/Uploads/foto-subida" + System.IO.Path.GetExtension(personPhotoFile.FileName)));
                personPhotoImage.ImageUrl = "~/assets/img/profile-placeholder.png";
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        else
        {
            return false;
        }
    }
}