<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="Ext.NET" Namespace="Ext.Net" TagPrefix="ext" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Currency Converter</title>
    <link type="text/css" rel="stylesheet" href="https://speed.ext.net/www/intro/css/main.css" />
</head>
<body>
    <ext:ResourceManager runat="server" Theme="Triton" />

    <form id="form1" runat="server">
        <ext:Panel
            ID="CurrencyConverterPanel"
            runat="server"
            Title="Currency Converter"
            Height="300"
            Width="400"
            Frame="true"
            BodyPadding="10"
            Layout="Anchor"
            DefaultAnchor="100%">
            <Items>
                <ext:ComboBox
                    ID="CurrencyFrom"
                    runat="server"
                    FieldLabel="From Currency"
                    DisplayField="CurrencyCode"
                    ValueField="CurrencyCode"
                    ForceSelection="true">
                    <Store>
                        <ext:Store ID="CurrencyFromStore" runat="server">
                            <Model>
                                <ext:Model ID="CurrencyFromModel" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="CurrencyCode" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                </ext:ComboBox>
                <ext:ComboBox
                    ID="CurrencyTo"
                    runat="server"
                    FieldLabel="To Currency"
                    DisplayField="CurrencyCode"
                    ValueField="CurrencyCode"
                    ForceSelection="true">
                    <Store>
                        <ext:Store ID="CurrencyToStore" runat="server">
                            <Model>
                                <ext:Model ID="CurrencyToModel" runat="server">
                                    <Fields>
                                        <ext:ModelField Name="CurrencyCode" />
                                    </Fields>
                                </ext:Model>
                            </Model>
                        </ext:Store>
                    </Store>
                </ext:ComboBox>
                <ext:NumberField
                    ID="Amount"
                    runat="server"
                    FieldLabel="Amount"
                    MinValue="0"
                    />
                <ext:Button
                    ID="ConvertButton"
                    runat="server"
                    Text="Convert"
                    Icon="Accept"
                    OnDirectClick="ConvertButton_Click"
                    />
                <ext:DisplayField
                    ID="Result"
                    runat="server"
                    FieldLabel="Result"
                    />
            </Items>
        </ext:Panel>
    </form>
</body>
</html>
