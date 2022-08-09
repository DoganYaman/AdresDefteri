<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Detay.aspx.cs" Inherits="AdresDefteri.Detay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
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
                                    <asp:Button ID="btnUpdate" runat="server" Text="Kaydet" OnClick="btnUpdate_Click"  />
                                    <asp:Label ID="lblInfo" runat="server" Text="Kaydedildi" Visible="False"></asp:Label>
                                    <asp:Button Text="Sil" runat="server" ID="btnDeleteAddress" OnClientClick="javascript:return confirm('Dikkat bu kaydı silmek üzeresiniz.')" OnClick="btnDeleteAddress_OnClick"/>
                                </td>
                            </tr>
                        </table>
    </div>
    </form>
</body>
</html>
