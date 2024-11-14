using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;

using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;
using System.Xml;


public partial class _Default : System.Web.UI.Page
{
    public string tipomenu = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["Id"] == null)
        {
            tipomenu = "0";

        }
        else
        {
            tipomenu = Request.QueryString["Id"];

        }
        TransformarXML();
    }
    private void TransformarXML()
    {
        //rutas
        string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/menu.xml";
        string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/template.xslt";
        //leemos la ruta
        XmlTextReader xmlTextReader = new XmlTextReader(xmlPath);
        //configuramos las credeciales del xlst
        XmlUrlResolver resolver = new XmlUrlResolver();
        resolver.Credentials = CredentialCache.DefaultCredentials;
        //configuramos los parametros leer  y transformar
        XsltSettings settings = new XsltSettings(true, true);
        //leer y cargar el archivo
        XslCompiledTransform xslt = new XslCompiledTransform();
        xslt.Load(xsltPath, settings, resolver);
        //
        StringBuilder stringBuilder = new StringBuilder();
        TextWriter tWriter = new StringWriter(stringBuilder);
        //configuramos los argumentos y pasamos los parametros
        XsltArgumentList xsltArgumentList = new XsltArgumentList();
        xsltArgumentList.AddParam("TipoMenu", "", tipomenu);
        //transformamos el xml a html
        xslt.Transform(xmlTextReader, xsltArgumentList, tWriter);
        //obtenemos resultado
        string resultado = stringBuilder.ToString();
        //vemos el resultado
        Response.Write(resultado);
    }
}