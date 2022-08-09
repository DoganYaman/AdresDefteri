<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Anasayfa.aspx.cs" Inherits="AdresDefteri.Anasayfa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Adres Defteri</title>
    <link href="Content/Style/main.css" rel="stylesheet" />
    <link href="Content/Script/fancyapps/source/jquery.fancybox.css" rel="stylesheet" />
    <script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="Content/Script/fancyapps/source/jquery.fancybox.js"></script>
    <script src="Content/Script/main.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="pageContainer">
            <div class="header">Adres Defteri</div>
            <div id="mainContent">
                <%-- Burada ana içerik yer alacak --%>
                <div id="operations">
                    <ul>
                        <li>
                            <a id="btnNewAddress" href="javascript:;">Yeni Adres</a>
                        </li>
                        <li>
                            <a id="btnAddresses" href="javascript:;">Adreslerim</a>
                        </li>
                    </ul>
                </div>
                <div id="operationContainer">
                    <div id="newAddress">
                        <table>
                            <tr>
                                <td>Ad</td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Ad boş geçilemez"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Soyad</td>
                                <td>
                                    <asp:TextBox ID="txtSurame" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSurame" ErrorMessage="Soyad boş geçilemez"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Takma Ad</td>
                                <td>
                                    <asp:TextBox ID="txtNick" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Doğum Tarihi</td>
                                <td>
                                    <asp:Calendar ID="calBirth" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="200px">
                                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                        <NextPrevStyle VerticalAlign="Bottom" />
                                        <OtherMonthDayStyle ForeColor="#808080" />
                                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                        <SelectorStyle BackColor="#CCCCCC" />
                                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                    </asp:Calendar>
                                </td>
                            </tr>
                            <tr>
                                <td>Cinsiyet</td>
                                <td>
                                    <asp:DropDownList ID="ddGender" runat="server">
                                        <asp:ListItem>Seçiniz</asp:ListItem>
                                        <asp:ListItem>Bayan</asp:ListItem>
                                        <asp:ListItem>Bay</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>Cep Telefonu</td>
                                <td>
                                    <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtMobile" ErrorMessage="Cep telefonu boş geçilemez"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Ev Telefon</td>
                                <td>
                                    <asp:TextBox ID="txtHome" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>E-Posta</td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Fax</td>
                                <td>
                                    <asp:TextBox ID="txtFax" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Adres</td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Not</td>
                                <td>
                                    <asp:TextBox ID="txtNote" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="btnSave" runat="server" Text="Kaydet" OnClick="btnSave_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="myAddresses">
                        <div id="searchControl">
                            <asp:TextBox runat="server" ID="txtSearchKeyword"/>
                            <asp:Button Text="Ara" runat="server" ID="btnSearch" CausesValidation="false" OnClick="btnSearch_OnClick"/>
                        </div>
                        <asp:GridView ID="gwAddresses" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="gwAddress">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Ad" />
                                <asp:BoundField DataField="Surname" HeaderText="Soyad" />
                                <asp:BoundField DataField="Nick" HeaderText="TakmaAd" />
                                <asp:BoundField DataField="MobileNumber" HeaderText="CepNumarası" />
                                <asp:BoundField DataField="Email" HeaderText="Eposta" />
                                <asp:HyperLinkField DataNavigateUrlFields="Id" DataNavigateUrlFormatString="Detay.aspx?id={0}" Text="Detay" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                    </div>
                </div>
                <div class="cls"></div>
            </div>
        </div>
    </form>
</body>
</html>
