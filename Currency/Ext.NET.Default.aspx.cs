using System;
using System.Web.UI;
using Ext.Net;
using Currency.Models;

public partial class Ext_NET_Default : Page
{
    private CurrencyRepository repository = new CurrencyRepository();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCurrencies();
        }
    }

    private void LoadCurrencies()
    {
        var rates = repository.GetCurrencyRates();
        CurrencyFromStore.DataSource = rates;
        CurrencyFromStore.DataBind();
        CurrencyToStore.DataSource = rates;
        CurrencyToStore.DataBind();
    }

    protected void ConvertButton_Click(object sender, DirectEventArgs e)
    {
        string fromCurrency = CurrencyFrom.SelectedItem.Value;
        string toCurrency = CurrencyTo.SelectedItem.Value;
        decimal amount = Convert.ToDecimal(Amount.Text);

        var rates = repository.GetCurrencyRates();
        var fromRate = rates.Find(r => r.CurrencyCode == fromCurrency).Rate;
        var toRate = rates.Find(r => r.CurrencyCode == toCurrency).Rate;
        decimal result = (amount / fromRate) * toRate;

        Result.Text = result.ToString("F2");
    }
}
