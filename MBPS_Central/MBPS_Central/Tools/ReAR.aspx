<%@ Page Title="ReAR" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReAR.aspx.cs" Inherits="MBPS_Central.Tools.ReAR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #request-form {
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
                <h1 class="page-header"><i class="fa fa-ticket fa-fw"></i>Reporting Assistance Request (ReAR)</h1>
                <div class="panel-heading">
                    For any Reporting and Web Application Requests or Incidents
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
                                CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6 form-group">
                            <label></label>
                            <div class="clearfix"></div>
                            <button id="ticket-new" type="button" class="btn btn-success pull-right"><i class="fa fa-plus fa-fw"></i> New Ticket</button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div id="request-form" class="panel-body">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>MBPS Extension #:</label>
                                <input id="txtmbpsext" class="form-control">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>MBPS Email:</label>
                                <input id="txtmbpsmail" class="form-control">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Type:</label>
                                <asp:DropDownList
                                    ID="ddlTypes"
                                    runat="server"
                                    ClientIDMode="Static"
                                    AppendDataBoundItems="true"
                                    CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Application:</label>
                                <select id="ddlApplication" class="form-control"></select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Action:</label>
                                <select id="ddlAction" class="form-control"></select>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Summary of concern:</label>
                                <input id="txtsummary" class="form-control">
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Ticket Description:</label>
                                <textarea id="txtDescription" rows="5" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <div>
                                    <label id="reqby">Requested By: </label>
                                </div>
                                <div>
                                    <label>Requested Date: <%: DateTime.Now.ToShortDateString() %></label>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="pull-right">
                            <button id="ticketcancel" type="button" class="btn btn-success"><i class="fa fa-times fa-fw"></i>Cancel</button>
                            <button id="ticketsubmit" type="button" class="btn btn-success"><i class="fa fa-send fa-fw"></i>Submit</button>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul class="nav nav-tabs mbps">
                    <li class="active"><a id="five-button" href="#five-pills" data-toggle="tab">Last 5 Tickets</a>
                    </li>
                    <li><a id="all-button" href="#five-pills" data-toggle="tab">All Tickets</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="five-pills">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 id="gridTitle"></h4>
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <asp:GridView
                                        ID="gridTickets"
                                        runat="server"
                                        CssClass="table table-striped table-bordered"
                                        AutoGenerateColumns="false"
                                        ClientIDMode="Static">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Ticket #"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Request"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Summary of Request"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions"></asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">ReAR Ticket No: <span id="ticketno"></span></h4>
                        </div>
                        <div class="modal-body">
                            <dl>
                                <dt>Summary of Concern</dt>
                                <dd id="summaryofconcern"></dd>
                                <dt>Description</dt>
                                <dd id="ticketdescription"></dd>
                                <dt>Date Requested</dt>
                                <dd id="ticketdate"></dd>
                                <dt>Ticket Status</dt>
                                <dd id="ticketstatus"></dd>
                                <dt>RA Assigned</dt>
                                <dd id="raname"></dd>
                                <dt>Date Processed</dt>
                                <dd id="starteddatex"></dd>
                                <dt>Date Completed</dt>
                                <dd id="completeddatex"></dd>
                                <dt>RA Remarks</dt>
                                <dd id="raremarksx"></dd>
                            </dl>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="surveyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel1"><span id="metrictitle1">Response Survey</span></h4>
                        </div>
                        <div class="modal-body">
                            <dl>
                                <dt>Metric Description</dt>
                                <dd id="metdesc1"></dd>
                                <dt>Item <span id="itemno1"></span></dt>
                                <dd id="metitem1"></dd>
                                <dt>Calculations (How it is measured)</dt>
                                <dd id="metcalc1"></dd>
                                <dt>Considerations (Special Additions or Excemptions)</dt>
                                <dd id="metcons1"></dd>
                                <dt>Best Practice (Benchmark or Best Targets)</dt>
                                <dd id="metbest1"></dd>
                                <dt>Frequency</dt>
                                <dd id="metfreq1"></dd>
                            </dl>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
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
                $('#reqby').html("Requested By: " + $('#lblName').text() + "<input type='hidden' value='" + $('#lblWDID').text() + "'>");
                
                $("#ddlTypes").change(function () {
                    displayApps($('#ddlTypes').val());
                });

                $("#ddlApplication").change(function () {
                    displayAction($('#ddlApplication').val());
                });

                $('#ticket-new').click(function () {
                    $('#request-form').slideDown('slow');
                })

                $('#gridTitle').html('Displaying Last 5 Tickets');
                displayReARTickets(true);

                $('#five-button').click(function () {
                    $('#gridTitle').html('Displaying ' + $(this).text() );
                    displayReARTickets(true);
                })

                $('#all-button').click(function () {
                    $('#gridTitle').html('Displaying ' + $(this).text());
                    displayReARTickets(false);
                })

                $('#ticketsubmit').click(function () {
                    var iVal = $('#ddlTypes').val();
                    if (iVal == 'Select Types...')
                    {
                        alert('Please select an option from the list...');
                        $('#ddlTypes').focus();
                    }
                    else if ($('#txtSummary').val() == '')
                    {
                        alert('Please input summary of concern...');
                        $('#txtSummary').focus();
                    }
                    else if ($('#txtDescription').val() == '') {
                        alert('Please input description of concern...');
                        $('#txtDescription').focus();
                    }
                    else
                    {
                    insertReAR();
                    $('#request-form').slideUp('slow');
                    displayReARTickets(true);
                    }
                })

                $('#ticketcancel').click(function () {
                    refresh();
                    $('#request-form').slideUp('slow');
                })
            })
        }

        function displayApps(concern) {
            $.ajax({
                type: "POST",
                url: "ReAR.aspx/displayApps",
                data: JSON.stringify({ 'concern': concern }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                $('#ddlApplication option').remove();
                $('#ddlAction option').remove();

                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var apps = xml.find("Table1");
                $.each(apps, function () {
                    var apps = $(this);
                    var o = new Option($(this).find("ScopeName").text(), $(this).find("ScopeID").text())
                    $(o).html($(this).find("ScopeName").text());
                    $('#ddlApplication').append(o);
                });
                displayAction($('#ddlApplication').val());
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function displayAction(scopeid) {
            $.ajax({
                type: "POST",
                url: "ReAR.aspx/displayAction",
                data: '{scopeid: ' + scopeid + '}',
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                $('#ddlAction option').remove();

                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var apps = xml.find("Table1");
                $.each(apps, function () {
                    var apps = $(this);
                    var o = new Option($(this).find("ConcernAction").text(), $(this).find("RequestID").text())
                    $(o).html($(this).find("ConcernAction").text());
                    $('#ddlAction').append(o);
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.responseText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };

        function insertReAR() {
            var arr = new Array();
            arr[0] = $('#ddlAction').val();
            arr[1] = $('#txtDescription').val();
            arr[2] = $('#ddlTeams').val();
            arr[3] = '<%: Session["WDID"] %>';
            arr[4] = $('#txtsummary').val();
            arr[5] = $('#txtmbpsext').val();
            arr[6] = $('#txtmbpsmail').val();

            $.ajax({
                type: "POST",
                url: "ReAR.aspx/saveReAR",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                refresh();
                alert('Saved!');
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };

        function refresh() {
            $('#ddlTypes').val('Select Types...');
            $('#ddlApplication option').remove();
            $('#ddlAction option').remove();
            $('#txtsummary').val('').empty();
            $('#txtDescription').val('').empty();
            $('#txtmbpsext').val('').empty();
            $('#txtmbpsmail').val('').empty();
        };

        function displayReARTickets(nticket)
        {
            var arr = new Array();
            arr[0] = '<%: Session["WDID"] %>';
            arr[1] = nticket;
            $.ajax({
                type: "POST",
                url: "ReAR.aspx/displayReARTickets",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var Tickets = xml.find("Table1");
                    var row = $("[id*=gridTickets] tr:last-child").clone(true);
                    $("[id*=gridTickets] tr").not($("[id*=gridTickets] tr:first-child")).remove();
                    $.each(Tickets, function () {
                        var Tickets = $(this);
                        var date = new Date();
                        $("td", row).eq(0).html($(this).find("TicketNo").text());
                        $("[id*=gridTickets]").append(row);
                        $("td", row).eq(1).html($(this).find("ConcernAction").text());
                        $("[id*=gridTickets]").append(row);
                        $("td", row).eq(2).html($(this).find("SummaryOfConcern").text());
                        $("[id*=gridTickets]").append(row);
                        date = new Date($(this).find("TicketDate").text())
                        $("td", row).eq(3).html(date.toLocaleString());
                        $("[id*=gridTickets]").append(row);
                        $("td", row).eq(4).html($(this).find("TicketStatus").text());
                        $("[id*=gridTickets]").append(row);
                        
                        $("td", row).eq(5).html("<input id='starteddate' type='hidden' value='" + $(this).find("StartedDate").text() + "'/><input id='completeddate' type='hidden' value='" + $(this).find("CompletedDate").text() + "'/><input id='raremarks' type='hidden' value='" + $(this).find("RARemarks").text() + "'/><a class='displayDetails' data-toggle='modal' data-target='#detailModal' href='#'><i class='fa fa-search fa-fw'></i>View Details</a><input type='hidden' value='" + $(this).find("TicketNo").text() + "'/><a id='resSurvey' class='resSurvey' data-toggle='modal' data-target='#surveyModal' href='#'><i class='fa fa-comment fa-fw'></i>Response Survey</a>")
                        $("[id*=gridTickets]").append(row);

                        //$("td", row).eq(6).html("");
                        //$("[id*=gridTickets]").append(row);
                        //$("td", row).eq(7).html("");
                        //$("[id*=gridTickets]").append(row);
                        //$("td", row).eq(8).html("");
                        //$("[id*=gridTickets]").append(row);

                        row = $("[id*=gridTickets] tr:last-child").clone(true);
                    })
                    viewdetails();
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
        function viewdetails() {
            $('.displayDetails').click(function () {
                //alert($(this).next().val());
                displaydetails($(this).next().val());
            })
        }

        function displaydetails(ticketno) {
            //alert(ticketno);
            $.ajax({
                type: "POST",
                url: "ReAR.aspx/viewDetails",
                data: '{ticketno: ' + ticketno + '}',
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                //alert(response.d);
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var exkeys = xml.find("Table1");
                $.each(exkeys, function () {
                    var date = new Date();
                    $('#ticketno').text($(this).find("TicketNo").text());
                    $('#summaryofconcern').text($(this).find("SummaryOfConcern").text());
                    $('#ticketdescription').text($(this).find("TicketDescription").text());

                    date = new Date($(this).find("TicketDate").text());
                    $('#ticketdate').text(date.toLocaleString());

                    $('#ticketstatus').text($(this).find("TicketStatus").text());
                    $('#raname').text($(this).find("RANAme").text());
                    
                    date = new Date($(this).find("StartedDate").text());
                    $('#starteddatex').html(date.toLocaleString());
                    
                    date = new Date($(this).find("CompletedDate").text());
                    $('#completeddatex').text(date.toLocaleString());
                    
                    $('#raremarksx').text($(this).find("RARemarks").text());
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
