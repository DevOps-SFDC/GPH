<%@ Page Title="Leader View - OPT" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EveLeadView.aspx.cs" Inherits="MBPS_Central.OPT.EveLeadView" %>
<%-- TO DO ON THIS PAGE

    EDIT PROCESSING
        MODAL FOR EDITING
    DISPLAY NPT
    EDIT NPT
        MODAL FOR EDITING
    
--%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #gridProc > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridProc > tbody > tr:first-child {
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
                <h1 class="page-header"><i class="fa fa-star fa-fw"></i>Leader View</h1>
                <div class="panel-heading">
                    OPT Entries - Leader View
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
                                ClientIDMode="Static"
                                AutoPostBack="False"
                                CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                         <div class="col-md-6 form-group">
                            <label>Month Year</label>
                            <asp:DropDownList
                                ID="ddlMonthYear"
                                runat="server"
                                AutoPostBack="false"
                                CssClass="form-control"
                                ClientIDMode="Static">
                            </asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                         <ul class="nav nav-tabs mbps">
                            <li class="active"><a href="#proc-pills" data-toggle="tab">Processing</a>
                            </li>
                            <li><a href="#npt-pills" data-toggle="tab">NPT</a>
                            </li>
                            <li><a href="#howto-pills" data-toggle="tab">How to Instructions</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="proc-pills">
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Processing</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridProc" class="table table-bordered dataTable no-footer">
                                                <thead><tr><th>Parent Worktype</th><th>Worktype</th><th>Associate</th><th>Reference</th><th>Volume</th><th>Start</th><th>End</th><th>Elapsed</th><th>Actions</th></tr></thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="npt-pills">
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>NPT</h4>
                                    </div>
                                    <div class="panel-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="howto-pills">
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>How to Use Leader View - OPT</h4>
                                    </div>
                                    <div class="panel-body">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                    </div>
                                </div>
                            </div>
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

        function initializer(sender, args) {

        }

        function ender(sender, args) {

        }

        function loader(sender, args) {
            $(document).ready(function () {
                displayProc();

                $('#ddlTeams').change(function () {
                    displayProc();
                })

                $('#ddlMonthYear').change(function () {
                    displayProc();
                })
            })
        }
        

        function displayProc()
        {
            $('#gridProc').dataTable().fnDestroy();
            $('#gridProc > tbody > tr').remove();

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            arr[1] = $('#ddlMonthYear').val();

            $.ajax({
                type: "POST",
                url: "EveLeadView.aspx/displayLeaves",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var opt = xml.find("Table1");
                    $.each(opt, function () {
                        var opt = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';
                            
                        col += $(this).find("ParentWorktypeName").text() + '</td> <td>';
                        col += $(this).find("WorktypeName").text() + '</td> <td>';
                        col += $(this).find("Name").text() + '</td> <td>';
                        col += $(this).find("Reference").text() + '</td> <td>';
                        col += $(this).find("Count").text() + '</td> <td>';
                        col += moment($(this).find("TimeStart").text()).format('MM/DD/YYYY HH:mm:ss A') + '</td> <td>';
                        col += moment($(this).find("TimeEnd").text()).format('MM/DD/YYYY HH:mm:ss A') + '</td> <td>';
                        col += $(this).find("Elapsed").text() + '</td> <td>';
                        col += '<input id="ProcID" type="hidden" value="' + $(this).find("WorktypeMetricsID").text() + '"/> <a id="procEdit" class="procEdit" href="#"><i class="fa fa-edit fa-fw"></i>Edit </a> <input type="hidden" value="' + $(this).find("IsPaused").text() + '" /> </td>';


                        $("[id*=gridProc] tbody").append($(row).append(col));
                    })
                    $("#gridProc").dataTable();
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }
    </script>
</asp:Content>
