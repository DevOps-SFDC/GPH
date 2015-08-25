<%@ Page Title="Team Leader View" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TeamLeader.aspx.cs" Inherits="MBPS_Central.TableF.TeamLeader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #gridTeam > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
            font-size: .85em;
        }

        #gridTeam > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }
        
        #gridMetric > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
            font-size: .85em;
        }

        #gridMetric > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-sliders fa-fw"></i>Table F Summary</h1>
                <div class="panel-heading">
                    Summary of your teams' Table F Metrics' Ratings
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="col-md-6 form-group">
                            <label>Team Selection</label>
                            <asp:DropDownList
                                ID="ddlTeams"
                                runat="server"
                                AutoPostBack="false"
                                CssClass="form-control"
                                ClientIDMode="Static">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Month - Year</label>
                            <asp:DropDownList
                                ID="ddlDate"
                                runat="server"
                                AutoPostBack="false"
                                CssClass="form-control"
                                ClientIDMode="Static">
                            </asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="teamsummary">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs mbps">
                            <li class="active"><a href="#team-pills" data-toggle="tab">Team Metrics' Summary</a></li>
                            <li><a href="#metric-pills" data-toggle="tab">Summary per Metric</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="team-pills">
                                <div id="start-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>PST Levels and Trends Calculations</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridTeam" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 25%">Item</th>
                                                        <th># Meeting</th>
                                                        <th># Not Meeting</th>
                                                        <th># Meeting / Improving</th>
                                                        <th>Total</th>
                                                        <th>% Meeting</th>
                                                        <th>% Meeting / Improving</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade in" id="metric-pills">
                                <div id="ato-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>per Metric</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridMetric" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 10%">Metrics</th>
                                                        <th style="width: 6%"></th>
                                                        <th style="width: 6%"></th>
                                                        <th style="width: 6%"></th>
                                                        <th style="width: 6%"></th>
                                                        <th style="width: 6%"></th>
                                                        <th style="width: 6%"></th>
                                                        <th style="width: 9%"># of Mo's achieving Target</th>
                                                        <th style="width: 9%"># of Mo's with Data</th>
                                                        <th style="width: 9%">Are Targets achieved 3/4ths of the time?</th>
                                                        <th style="width: 9%">Is Performance improvement expected?</th>
                                                        <th style="width: 9%">Is there sustained Performance improvement?</th>
                                                        <th style="width: 9%">Is Individual Metric Compliant?</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var prm = new Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(initializer);
        prm.add_endRequest(ender);
        prm.add_pageLoaded(loader);

        function initializer(sender, args) {

        }

        function ender(sender, args) {

        }

        function loader(sender, args) {
            $(document).ready(function () {
                $('#ddlDate').change(function () {
                    SummaryDisplay();
                })
            })
        }

        DateDisplay();

        function DateDisplay() {
            $.ajax({
                type: "POST",
                url: "TeamLeader.aspx/DateDisplay",
                data: '{teamid: ' + $('#ddlTeams').val() + ' }',
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var teammetrics = xml.find("Table1");
                $("#ddlDate").empty();
                $.each(teammetrics, function () {
                    var newOption = "<option value='" + $(this).find("Dates").text() + "'>" + $(this).find("Dates").text() + "</option>";
                    $("#ddlDate").append(newOption);
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function SummaryDisplay() {
            $("#gridTeam > tbody > tr").remove();
            $("#gridMetric > tbody > tr").remove();
            var date = $('#ddlDate').val();
            var dateparts = date.split(' - ');
            var ratedate = dateparts[0] + ' 1, ' + dateparts[1];
            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            arr[1] = ratedate;
            $.ajax({
                type: "POST",
                url: "TeamLeader.aspx/SummaryDisplay",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var teammetrics = xml.find("Table");
                $.each(teammetrics, function () {
                    var row = '<tr></tr>';
                    var col = '<td>';
                    col += $(this).find("Name").text() + "<input type='hidden' value='" + $(this).find("ItemID").text() + "'/>" + '</td> <td>';
                    col += $(this).find("Meeting").text() + '</td> <td>';
                    col += $(this).find("NotMeeting").text() + '</td> <td>';
                    col += $(this).find("MeetingImproving").text() + '</td> <td>';
                    col += $(this).find("Total").text() + '</td> <td>';
                    col += $(this).find("MeetingPer").text() + '</td> <td>';
                    col += $(this).find("MeetingImprovingPer").text() + '</td>';
                    $("[id*=gridTeam] tbody").append($(row).append(col));
                });
                var teammetrics = xml.find("Table1");
                $.each(teammetrics, function () {
                    var row = '<tr></tr>';
                    var col = '<td>';
                    col += $(this).find("Metrics").text() + "<input type='hidden' value='" + $(this).find("MetricID").text() + "'/>" + '</td> <td>';
                    col += $(this).find("Rate1").text() + '</td> <td>';
                    col += $(this).find("Rate2").text() + '</td> <td>';
                    col += $(this).find("Rate3").text() + '</td> <td>';
                    col += $(this).find("Rate4").text() + '</td> <td>';
                    col += $(this).find("Rate5").text() + '</td> <td>';
                    col += $(this).find("Rate6").text() + '</td> <td>';
                    col += $(this).find("AchievingTarget").text() + '</td> <td>';
                    col += $(this).find("WithData").text() + '</td> <td>';
                    col += $(this).find("ThreeForth").text() + '</td> <td>';
                    col += $(this).find("PerfExpected").text() + '</td> <td>';
                    col += $(this).find("PerfImproved").text() + '</td> <td>';
                    col += $(this).find("Complaint").text() + '</td>';
                    $("[id*=gridMetric] tbody").append($(row).append(col));
                    $("[id*=gridMetric] th:nth-child(2)").text($(this).find("Date1").text());
                    $("[id*=gridMetric] th:nth-child(3)").text($(this).find("Date2").text());
                    $("[id*=gridMetric] th:nth-child(4)").text($(this).find("Date3").text());
                    $("[id*=gridMetric] th:nth-child(5)").text($(this).find("Date4").text());
                    $("[id*=gridMetric] th:nth-child(6)").text($(this).find("Date5").text());
                    $("[id*=gridMetric] th:nth-child(7)").text($(this).find("Date6").text());
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }
    </script>
</asp:Content>
