<%@ Page Title="Daily Logs" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DailyLogs.aspx.cs" Inherits="MBPS_Central.Reports.KhronosLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--<script src="../Content/jquery-ui.js"></script>
    <script src="../bootstrap/js/plugins/morris/morris.js"></script>
    <script src="../bootstrap/js/plugins/morris/morris-data.js"></script>
    <script src="../bootstrap/js/plugins/morris/raphael.min.js"></script>
    <script src="../Scripts/xml2json.js"></script>--%>
    <style>
         #gridLogs > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridLogs > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }


        .ui-datepicker-calendar {
            display: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-tag fa-fw"></i>Daily Logs</h1>
                <div class="panel-heading">
                    View your staff Daily Time IN/OUT Logs
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="col-md-4 form-group">
                            <label>Team Selection</label>
                            <asp:DropDownList
                                ID="ddlTeams"
                                runat="server"
                                AutoPostBack="false"
                                CssClass="form-control"
                                ClientIDMode="Static">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4 form-group">
                            <label>Staff Selection</label>
                            <asp:DropDownList
                                ID="ddlStaff"
                                runat="server"
                                CssClass="form-control"
                                ClientIDMode="Static">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-4 form-group">
                            <label>Year Month Selection</label>
                            <input id="monthyear" class="form-control dtpick">
                            <input id="monther" type="hidden" />
                            <input id="yearer" type="hidden" />
                        </div>
                        <div style="float: right">
                            <button id="displayLogs" type="button" class="btn btn-success"><i class="fa fa-refresh fa-fw"></i>Show Khronos Logs</button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table id="gridLogs" class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>WorkdayID</th>
                                        <th>Name</th>
                                        <th>Dates</th>
                                        <th>Time Shift</th>
                                        <%--<th>StartShift</th>
                                        <th>EndShift</th>--%>
                                        <th>LogIn</th>
                                        <th>LogOut</th>
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
    <script type="text/javascript">
        var prm = new Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(initializer);
        prm.add_endRequest(ender);
        prm.add_pageLoaded(loader);

        var currDate = new Date();

        var opts = {
            lines: 13, // The number of lines to draw
            length: 30, // The length of each line
            width: 5, // The line thickness
            radius: 25, // The radius of the inner circle
            corners: 1, // Corner roundness (0..1)
            rotate: 0, // The rotation offset
            direction: 1, // 1: clockwise, -1: counterclockwise
            color: '#000', // #rgb or #rrggbb or array of colors
            speed: 2.2, // Rounds per second
            trail: 38, // Afterglow percentage
            shadow: false, // Whether to render a shadow
            hwaccel: true, // Whether to use hardware acceleration
            className: 'spinner', // The CSS class to assign to the spinner
            zIndex: 2e9, // The z-index (defaults to 2000000000)
            top: '50%', // Top position relative to parent
            left: '50%' // Left position relative to parent
        };
        var spinner = new Spinner(opts);

        function initializer(sender, args) {

        }

        function ender(sender, args) {

        }

        function loader(sender, args) {
            $(document).ready(function () {
                displayTeamStaff();

                $('#ddlTeams').change(function () {
                    displayTeamStaff();
                })
                
                $('#monthyear').val(currDate.format('MMMM yyyy'));
                $('#monther').val(currDate.getMonth() + 1);
                $('#yearer').val(currDate.getFullYear());

                $('#monthyear').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'MM yy',
                    onClose: function (dateText, inst) {
                        var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                        var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                        $(this).datepicker('setDate', new Date(year, month, 1));
                        $('#monther').val(new Date(year, month, 1).getMonth() + 1);
                        $('#yearer').val(new Date(year, month, 1).getFullYear());
                    }
                })

                $('#displayLogs').click(function () {
                    fudger(1);
                })

                $('#displayDoors').click(function () {
                    fudger(2);
                })
            })
        }

        function displayTeamStaff() {
            var arr = new Array();
            arr[0] = $("#ddlTeams").val();
            $.ajax({
                type: "POST",
                url: "DailyLogs.aspx/getTeamStaff",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    $("#ddlStaff option").remove();
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var worktype = xml.find("Table1");
                    $.each(worktype, function () {
                        var worktype = $(this);
                        var o = new Option($(this).find("Name").text(), $(this).find("WorkdayID").text())
                        $(o).html($(this).find("Name").text());
                        $('#ddlStaff').append(o);
                    });
                },
                error: function AjaxError(response) {
                    alert(response.status + ' ' + response.responseText);
                },
                failure: function AjaxFailure(response) {
                    alert(response.status + ' ' + response.statusText);
                }
            });
        }

        function fudger(x) {
            $("#gridLogs > tbody > tr").remove();
            xxx();

            //var arr = new Array();
            //arr[0] = $('#ddlTeams').val()
            //if (!isNaN(parseFloat($('#ddlStaff').val())) && isFinite($('#ddlStaff').val()))
            //{ arr[1] = $('#ddlStaff').val(); } else { arr[1] = 0; }
            //arr[2] = $('#monther').val();
            //arr[3] = $('#yearer').val();
            //arr[4] = x;
            var date = new Date($('#yearer').val() , $('#monther').val() - 1 , 1);
            var arr = new Array();
            arr[0] = $('#ddlStaff').val();
            arr[1] = date;
            $.ajax({
                type: "POST",
                url: "DailyLogs.aspx/GetLogs",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ _arr: arr }),
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var exkeys = xml.find("Table1");
                    $.each(exkeys, function () {
                        var exkeys = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("WorkdayID").text() + '</td> <td>';
                        col += $(this).find("Name").text() + '</td> <td>';
                        col += moment($(this).find("Date").text()).utcOffset(480).format('MM/DD/YYYY') + ' (' + $(this).find("DAYNAME").text() + ')</td> <td>';
                        col += $(this).find("TimeShift").text() + '</td> <td>';
                        //col += moment($(this).find("StartShift").text()).format('hh:mm A') + '</td> <td>';
                        //col += moment($(this).find("EndShift").text()).format('hh:mm A') + '</td> <td>';
                        if ($(this).find("Login").text()) {
                            col += moment($(this).find("Login").text()).utcOffset(480).format('hh:mm A') + '</td> <td>';
                        }
                        else {
                            if ($(this).find("CORRTimeIN").text()) {
                                col += moment($(this).find("CORRTimeIN").text()).utcOffset(480).format('hh:mm A') + '</td> <td>';
                            }
                            else {
                                col += '</td> <td>';
                            }
                        }

                        if ($(this).find("LogOut").text()) {
                            col += moment($(this).find("LogOut").text()).utcOffset(480).format('hh:mm A') + '</td>';
                        }
                        else {
                            if ($(this).find("CORRTimeOUT").text()) {
                                col += moment($(this).find("CORRTimeOUT").text()).utcOffset(480).format('hh:mm A') + '</td>';
                            }
                            else {
                                col += '</td>';
                            }
                        }
                        
                        

                        $("[id*=gridLogs] tbody").append($(row).append(col));
                    });
                    yyy();
                },
                error: function AjaxError(response) {
                    alert(response.status + ' ' + response.statusText);
                    yyy();
                },
                failure: function AjaxFailure(response) {
                    alert(response.status + ' ' + response.statusText);
                    yyy();
                }
            });
        }

        function xxx() {
            var target = document.getElementById('gridLogs');
            spinner.spin(target);
        }
        function yyy() {
            spinner.stop();
        }
    </script>
</asp:Content>
