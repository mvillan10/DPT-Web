<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bubbleChart.aspx.cs" Inherits="DigitalPeaceTalks.bubbleChart" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:Chart ID="Chart1" runat="server">
        <Series>
            <asp:Series Name="Series1"></asp:Series>
            <asp:Series Name="Series2"></asp:Series>
            <asp:Series Name="Series3"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                <AxisY>
                    <MajorGrid Enabled="False" />
                </AxisY>
                <AxisX>
                    <MajorGrid Enabled="false" />
                </AxisX>
            </asp:ChartArea>

        </ChartAreas>
    </asp:Chart>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
