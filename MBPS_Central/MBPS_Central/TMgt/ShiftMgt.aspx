<%@ Page Title="Shift Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShiftMgt.aspx.cs" Inherits="MBPS_Central.TMgt.ShiftMgt" %>
<%-- 
    TO DO
    1. Fix By selected Staff - DONE
     --%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        .tooltip-container {
            text-align: center;
        }

        #gridEmpShift > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridEmpShift > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridEmpShiftP > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridEmpShiftP > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridStaff > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridStaff > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridStaffSched > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridStaffSched > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #modalShiftForm > .modal-dialog {
            width:800px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-clock-o fa-fw"></i>Shift Management</h1>
                <div class="panel-heading">
                    Manage your team members' shift
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
                                CssClass="form-control"
                                ClientIDMode="Static">
                            </asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <ul class="nav nav-tabs mbps">
                            <li class="active"><a href="#team-pills" data-toggle="tab">By Team</a>
                            </li>
                            <li><a href="#indi-pills" data-toggle="tab">By Individual</a>
                            </li>
                            <li><a href="#howto-pills" data-toggle="tab">How To Instructions</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="team-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Shift for Team</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-sm-4">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Start Date</label>
                                                    <input id="startdatet" class="form-control dtpick">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>End Date</label>
                                                    <input id="enddatet" class="form-control dtpick">
                                                </div>

                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="alert alert-success">
                                                <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Start Date and End Date of Shift effectivity. Leave End Date blank if indefinite.</p>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label>Days Shift</label>
                                                <asp:DropDownList ID="ddlDayShiftT" runat="server" CssClass="form-control" AppendDataBoundItems="true" ClientIDMode="Static"></asp:DropDownList>
                                            </div>
                                            <div class="alert alert-success">
                                                <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Predefined selection of Days Shifts</p>
                                            </div>
                                        </div>
                                        <div id="definedshiftT" class="col-sm-4">
                                            <div class="form-group">
                                                <label>Time Shift</label>
                                                <asp:DropDownList ID="ddlTimeShiftT" runat="server" CssClass="form-control" AppendDataBoundItems="true" ClientIDMode="Static"></asp:DropDownList>
                                            </div>
                                            <div class="alert alert-success">
                                                <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Predefined selection of Time Shifts</p>
                                            </div>
                                        </div>
                                        <div id="customshiftT" class="col-sm-4 mbpshidden">
                                            <div id="customshiftstartT" class="col-md-6">
                                                <div class="form-group">
                                                    <label>Start Shift</label>
                                                    <div>
                                                        <input id="starttimet" class="form-control timepicker" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="customshiftendT" class="col-md-6">
                                                <div class="form-group">
                                                    <label>End Shift</label>
                                                    <div>
                                                        <input id="endtimet" class="form-control timepicker" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="alert alert-success">
                                                <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Custom Time Shifts</p>
                                            </div>
                                        </div>
                                        <div class="col-sm-1">
                                            <div class="tooltip-container">
                                                <button id="btnChangeT" type="button" class="btn btn-success" data-toggle="tooltip" data-placement="left" title="Change to Predefined or Custom"><i class="fa fa-refresh fa-fw"></i></button>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="pull-right">
                                            <button id="shiftallclear" type="button" class="btn btn-success"><i class="fa fa-eraser fa-fw"></i> Clear</button>
                                            <button id="shiftallapplyselect" type="button" class="btn btn-success"><i class="fa fa-group fa-fw"></i>Apply to Selected</button>
                                            <button id="shiftallapply" type="button" class="btn btn-success"><i class="fa fa-sitemap fa-fw"></i> Apply to All</button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>

                                <div id="shiftapplyselecttable" class="panel panel-default mbpshidden">
                                    <div class="panel-heading">
                                        <h4>Staff</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive col-md-6">
                                            <table id="gridStaffSched" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>WorkdayID</th>
                                                        <th>Name</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                            <div class="modal fade" id="modalShiftPreview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabelP"><span id="empnameP"></span></h4><input id="modalteamempidP" type="hidden" />
                                                    </div>
                                                    <div class="modal-body">
                                                        <div id="divshiftP">
                                                            <div class="table-responsive">
                                                                <table id="gridEmpShiftP" class="table table-bordered">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Effective Date Start</th>
                                                                            <th>Effective Date End</th>
                                                                            <th>Day Shift</th>
                                                                            <th>Shift</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody></tbody>
                                                                </table>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        <button type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                            <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>
                                                    <asp:GridView
                                                        ID="gridStaffSched"
                                                        runat="server"
                                                        CssClass="table table-bordered"
                                                        AutoGenerateColumns="false"
                                                        ClientIDMode="Static">
                                                        <Columns>
                                                            <asp:BoundField DataField="WorkdayID" HeaderText="Workday ID" />
                                                            <asp:BoundField DataField="Name" HeaderText="Name" />
                                                            <asp:TemplateField HeaderText="Actions">
                                                                <ItemTemplate>
                                                                    <label class="checkbox-inline">
                                                                        <input type="checkbox">Select
                                                           
                                                                    </label>
                                                                    &nbsp;&nbsp;<a id="viewshift" class="viewshift" href="#"><i class="fa fa-search fa-fw"></i>View Shift</a>
                                                                    <asp:HiddenField ID="hfTeamEmp" runat="server" Value='<%# Eval("TeamEmpID") %>' />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlTeams" EventName="SelectedIndexChanged" />
                                                </Triggers>
                                            </asp:UpdatePanel>--%>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="alert alert-success">
                                                <p class="help-block">
                                                    <i class="fa fa-info-circle fa-fw"></i>
                                                    To apply the selected shift to selected staff, simply click the <strong>Select Check Box</strong>.<br />
                                                    You may review the shift of each staff by clicking the <strong>View Shift button</strong>.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="pull-right">
                                            <button id="shiftapplyselectcancel" type="button" class="btn btn-success"><i class="fa fa-times fa-fw"></i>Cancel</button>
                                            <button id="shiftapplyselect" type="button" class="btn btn-success"><i class="fa fa-floppy-o fa-fw"></i>Save</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="indi-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Shift for Individual Staff</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridStaff" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>WorkdayID</th>
                                                        <th>Name</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>

                                        <div class="modal fade" id="modalShiftForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel"><span id="empname"></span></h4><input id="modalteamempid" type="hidden" />
                                                    </div>
                                                    <div class="modal-body">
                                                        <div id="divshift">
                                                            
                                                            <div class="table-responsive">
                                                                <table id="gridEmpShift" class="table table-bordered">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Effective Date Start</th>
                                                                            <th>Effective Date End</th>
                                                                            <th>Day Shift</th>
                                                                            <th>Shift</th>
                                                                            <th>Actions</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody></tbody>
                                                                </table>
                                                            </div>

                                                            <div id="newshift-panel" class="panel panel-default">
                                                                <div class="panel-heading">
                                                                    <label>New Shift</label>
                                                                </div>

                                                                <div class="panel-body">
                                                                    <div class="col-md-6">
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label>Start Date</label>
                                                                                <input id="startdate" class="form-control dtpick">
                                                                            </div>
                                                                        </div>

                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label>End Date</label>
                                                                                <input id="enddate" class="form-control dtpick">
                                                                            </div>
                                                                        </div>

                                                                        <div class="clearfix"></div>

                                                                        <div class="alert alert-success">
                                                                            <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Start Date and End Date of Shift effectivity. Leave End Date blank if indefinite.</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label>Days Shift</label>
                                                                            <asp:DropDownList ID="ddlDayShift" runat="server" CssClass="form-control" AppendDataBoundItems="true" ClientIDMode="Static"></asp:DropDownList>
                                                                        </div>
                                                                        <div class="alert alert-success">
                                                                            <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Predefined selection of Days Shifts</p>
                                                                        </div>
                                                                    </div>

                                                                    <div class="clearfix"></div>
                                                                    <div class="col-md-6">
                                                                        <div id="definedshift" class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label>Time Shift</label>
                                                                                <asp:DropDownList ID="ddlTimeShift" runat="server" CssClass="form-control" AppendDataBoundItems="true" ClientIDMode="Static"></asp:DropDownList>
                                                                            </div>
                                                                            <div class="alert alert-success">
                                                                                <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Predefined selection of Time Shifts</p>
                                                                            </div>
                                                                        </div>
                                                                        <div id="customshift" class="col-md-12 mbpshidden">
                                                                            <div id="customshiftstart" class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>Start Shift</label>
                                                                                    <div>
                                                                                        <input id="starttime" class="form-control timepicker" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div id="customshiftend" class="col-md-6">
                                                                                <div class="form-group">
                                                                                    <label>End Shift</label>
                                                                                    <div>
                                                                                        <input id="endtime" class="form-control timepicker" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="clearfix"></div>
                                                                            <div class="alert alert-success">
                                                                                <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Custom Time Shifts</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="col-sm-1">
                                                                        <div class="tooltip-container">
                                                                            <button id="btnChange" type="button" class="btn btn-success" data-toggle="tooltip" data-placement="left" title="Change to Predefined or Custom"><i class="fa fa-refresh fa-fw"></i></button>
                                                                        </div>
                                                                    </div>
                                                                    <div class="clearfix"></div>

                                                                    <div class="pull-right">
                                                                        <button id="newshiftcancel" type="button" class="btn btn-success"><i class="fa fa-times fa-fw"></i>Cancel</button>
                                                                        <button id="newshiftsave" type="button" class="btn btn-success"><i class="fa fa-floppy-o fa-fw"></i>Save</button>
                                                                    </div>
                                                                    <div class="clearfix"></div>
                                                                </div>
                                                            </div>
                                                            <div class="command-panel pull-right">
                                                                <%--<button id="return" type="button" class="btn btn-success"><i class="fa fa-rotate-left fa-fw"></i>Return</button>--%>
                                                                <button id="newshift" type="button" class="btn btn-success"><i class="fa fa-plus-square fa-fw"></i>New Shift</button>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
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
                            </div>
                            <div class="tab-pane fade" id="howto-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>How to Manage Shifts</h4>
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
        var ts = 'Please Select Time Shift';
        var ds = 'Please Select Day Shift';

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
                $('#newshift-panel').hide();

                $('.timepicker').timepicker({
                    timeFormat: 'hh:mm tt',
                    controlType: 'select'
                });

                $('.tooltip-container').tooltip({
                    selector: "[data-toggle=tooltip]",
                    container: "body"
                })

                refreshDate();

                $('#ddlTeams').change(function () {
                    displayTeamStaff();
                    clearAll();
                })

                displayTeamStaff();

                // By Individual

                $('#newshift').click(function () {
                    $('.dtpick').val('');
                    $('#ddlTimeShift').val(ts);
                    $('#ddlDayShift').val(ds);
                    $('#newshift-panel').slideDown('slow');
                    $('html, body').animate({ scrollTop: $("#newshift-panel").offset().top }, 1000);
                    if ($('#customshift').is(":visible")) {
                        $('#definedshift').toggle();
                        $('#customshift').toggle();
                    }
                })

                $('#newshiftcancel').click(function () {
                    $('#newshift-panel').slideUp('slow');
                })

                //By Team

                $('#btnChangeT').click(function () {
                    $('#definedshiftT').toggle();
                    $('#customshiftT').toggle();
                })

                $('#btnChange').click(function () {
                    $('#definedshift').toggle();
                    $('#customshift').toggle();
                })

                $('#shiftallclear').click(function () {
                    clearAll();
                })

                $('#shiftallapplyselect').click(function () {
                    $('#shiftapplyselecttable').slideDown();
                    $('html, body').animate({ scrollTop: $("#shiftapplyselecttable").offset().top }, 1000);
                })

                $('#newshiftsave').click(function () {
                    if ($('#customshift').is(':visible')) {
                        if (validateCustom($('#starttime').val(), $('#endtime').val())) {

                            insertNewShift(document.getElementById('startdate').value, document.getElementById('enddate').value, $('#starttime').val(), $('#endtime').val());
                            $('.dtpick').val('');
                            $('#ddlTimeShift').val(ts);
                            $('#ddlDayShift').val(ds);
                            $('#newshift-panel').slideUp('slow');
                        }
                    }
                    else {
                        if (validateShiftInfo($('#startdate').val(), $('#ddlDayShift').val(), $('#ddlTimeShift').val())) {

                            insertNewShift(document.getElementById('startdate').value, document.getElementById('enddate').value, $('#starttime').val(), $('#endtime').val());
                            $('.dtpick').val('');
                            $('#ddlTimeShift').val(ts);
                            $('#ddlDayShift').val(ds);
                            $('#newshift-panel').slideUp('slow');
                        }
                    }

                })

                $('#shiftallapply').click(function () {
                    $("#gridStaff > tbody > tr").each(function () {
                        if ($('#customshiftT').is(':visible')) {
                            if (validateCustom($('#starttimet').val(), $('#endtimet').val())) {
                                insertNewShiftAll(document.getElementById('startdatet').value, document.getElementById('enddatet').value, $('#starttimet').val(), $('#endtimet').val(), $(this).children().last().find('input[type="hidden"]').val());
                            }
                        }
                        else {
                            if (validateShiftInfo($('#startdatet').val(), $('#ddlDayShiftT').val(), $('#ddlTimeShiftT').val())) {
                                insertNewShiftAll(document.getElementById('startdatet').value, document.getElementById('enddatet').value, $('#starttimet').val(), $('#endtimet').val(), $(this).children().last().find('input[type="hidden"]').val());
                            }
                        }
                    })
                    $('.dtpick').val('');
                    $('#ddlTimeShiftT').val(ts);
                    $('#ddlDayShiftT').val(ds);
                })
                
                $('#shiftapplyselect').click(function () {
                    $("#gridStaffSched > tbody > tr").each(function () {
                        var checkBox = $(this).find('input[type="checkbox"]')
                        if ($(checkBox).is(':checked')) {
                            if ($('#customshiftT').is(':visible')) {
                                if (validateCustom($('#starttimet').val(), $('#endtimet').val())) {
                                    insertNewShiftAll(document.getElementById('startdatet').value, document.getElementById('enddatet').value, $('#starttimet').val(), $('#endtimet').val(), $(this).find('input[type="hidden"]').val());
                                }
                            }
                            else {
                                if (validateShiftInfo($('#startdatet').val(), $('#ddlDayShiftT').val(), $('#ddlTimeShiftT').val())) {
                                    insertNewShiftAll(document.getElementById('startdatet').value, document.getElementById('enddatet').value, $('#starttimet').val(), $('#endtimet').val(), $(this).find('input[type="hidden"]').val());
                                }
                            }
                        }
                    })
                    clearAll();
                    resetCheckbox();
                    $('#shiftapplyselecttable').slideUp(1500);
                })

                $('#shiftapplyselectcancel').click(function () {
                    resetCheckbox();
                    $('#shiftapplyselecttable').slideUp(1500);
                })

               
            })
        }

        function clearAll()
        {
            $('.dtpick').val('');
            $('.timepicker').val('');
            $('#ddlTimeShiftT').val(ts);
            $('#ddlDayShiftT').val(ds);

            if ($('#customshiftT').is(':visible')) {
                $('#definedshiftT').toggle();
                $('#customshiftT').toggle();
            }
        }

        function resetCheckbox()
        {
            $("#gridStaffSched > tbody > tr").each(function () {
                var checkBox = $(this).find('input[type="checkbox"]');
                if ($(checkBox).is(':checked')) {
                    checkBox.prop('checked', false);
                }
            })
        }

        function validateShiftInfo(date, day, time) {
            var valid = true;
            var d = new Date(date);
            if (isNaN(d) == true) {
                alert("No Start Date selected...");
                valid = false;
            }
            else if (day == ds) {
                alert("No Day Shift selected...");
                valid = false;
            }
            else if (time == ts) {
                alert("No Time Shift selected...");
                valid = false;
            }
            return valid;
        }

        function validateCustom(custart, cusend) {
            var valid = true;
            //var d = new Date(custart);
            if (custart == "") {
                alert('Invalid Start Shift')
                valid = false;
            }
            //d = new Date(cusend)
            if (cusend == "") {
                alert('Invalid End Shift')
                valid = false;
            }
            return valid;
        }

        function refreshDate() {
            $("#startdatet").datepicker("destroy");
            $("#enddatet").datepicker("destroy");
            $("#startdate").datepicker("destroy");
            $("#enddate").datepicker("destroy");

            $("#startdatet").datepicker({
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 3,
                onClose: function (selectedDate) {
                    $("#enddate").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#enddatet").datepicker({
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 3,
                onClose: function (selectedDate) {
                    $("#startdate").datepicker("option", "maxDate", selectedDate);
                }
            });
            $("#startdate").datepicker({
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 3,
                onClose: function (selectedDate) {
                    $("#enddate").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#enddate").datepicker({
                changeMonth: true,
                changeYear: true,
                numberOfMonths: 3,
                onClose: function (selectedDate) {
                    $("#startdate").datepicker("option", "maxDate", selectedDate);
                }
            });
        }

        function displayTeamStaff() {
            $('#gridStaff > tbody > tr').remove();
            $('#gridStaffSched > tbody > tr').remove();

            var arr = new Array();
            arr[0] = $("#ddlTeams").val();
            $.ajax({
                type: "POST",
                url: "ShiftMgt.aspx/getTeamStaff",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var table = xml.find("Table1");
                    $.each(table, function () {
                        var table = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("WorkdayID").text() + '</td> <td>';
                        col += "<input id='hfteamempid' type='hidden' value='" + $(this).find("TeamEmpID").text() + "' />" + $(this).find("Name").text() + '</td> <td>';
                        col += '<a id="editShift" class="editShift" href="#" data-toggle="modal" data-target="#modalShiftForm"><i class="fa fa-edit fa-fw"></i>Edit Shift</a> <input type="hidden" value="' + $(this).find("TeamEmpID").text() + '" />';

                        $("#gridStaff > tbody").append($(row).append(col));
                    });

                    $.each(table, function () {
                        var table = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("WorkdayID").text() + '</td> <td>';
                        col += "<input id='hfteamempid' type='hidden' value='" + $(this).find("TeamEmpID").text() + "' />" + $(this).find("Name").text() + '</td> <td>';
                        col += '<div class="checkbox"><label><input type="checkbox"/>Select </label></div> <a id="viewShift" class="viewShift" href="#" data-toggle="modal" data-target="#modalShiftPreview"><i class="fa fa-edit fa-fw"></i>View Shift</a> <input type="hidden" value="' + $(this).find("TeamEmpID").text() + '" />';
                        
                        $("#gridStaffSched > tbody").append($(row).append(col));
                    });

                    $('.editShift').click(function (event) {
                        $('#newshift-panel').hide();
                        $('#empname').html('Shift for ' + $(this).parent().prev().text());
                        $('#modalteamempid').val($(this).next().val());
                        displayEmpShift($(this).next().val());
                    })

                    $('.viewShift').click(function (event) {
                        $('#empnameP').html('Shift for ' + $(this).parent().prev().text());
                        $('#modalteamempidP').val($(this).next().val());
                        displayEmpShift($(this).next().val());
                    })
                },
                error: function AjaxError(response) {
                    alert(response.status + ' ' + response.responseText);
                },
                failure: function AjaxFailure(response) {
                    alert(response.status + ' ' + response.statusText);
                }
            });
        }

        function displayEmpShift(teamempid) {
            $('#gridEmpShift > tbody > tr').remove();
            $('#gridEmpShiftP > tbody > tr').remove();

            $.ajax({
                type: "POST",
                url: "ShiftMgt.aspx/test1",
                data: '{teamempid: ' + teamempid + '}',
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: function AjaxSucceeded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var shifts = xml.find("Table1");
                    $.each(shifts, function () {
                        var shifts = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += moment($(this).find("StartDate").text()).utcOffset(480).format('MM/DD/YYYY') + '</td> <td>';
                        var tmp = moment($(this).find("EndDate").text()).utcOffset(480).format('MM/DD/YYYY');
                        if (tmp === 'Invalid date') {
                            col += 'Indefinite' + '</td> <td>';
                        } else { col += tmp + '</td> <td>'; }

                        col += $(this).find("DayShift").text() + '</td> <td>';
                        col += $(this).find("Shift").text() + '</td>  <td>';
                        col += '<input type="hidden" value="' + $(this).find("EmpShiftID").text() + '"><a id="cancelShift" class="cancelShift" href="#"><i class="fa fa-eraser fa-fw"></i>Remove</a></td>';

                        $("[id*=gridEmpShift] tbody").append($(row).append(col));
                    });

                    $('.cancelShift').click(function () {
                        cancelShift($(this).prev().val());
                    });
                }
,
                error: function AjaxError(response) {
                    alert(response.status + ' ' + response.statusText);
                },
                failure: function AjaxFailure(response) {
                    alert(response.status + ' ' + response.statusText);
                }
            });
        }

        function insertNewShift(start, end, custart, cusend) {
            var arr = new Array();
            arr[0] = $('#modalteamempid').val();
            arr[1] = $('#ddlTimeShift').val();
            arr[2] = $('#ddlDayShift').val();
            arr[3] = start;
            arr[4] = end;
            arr[5] = '<%: Session["WDID"] %>';
            arr[6] = custart;
            arr[7] = cusend;
            $.ajax({
                type: "POST",
                url: "ShiftMgt.aspx/saveNewShift",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ _arr: arr }),
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    displayEmpShift($('#modalteamempid').val());
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            })
        };

        function insertNewShiftAll(start, end, custart, cusend, teamempid) {
            var arr = new Array();
            arr[0] = teamempid;
            arr[1] = $('#ddlTimeShiftT').val();
            arr[2] = $('#ddlDayShiftT').val();
            arr[3] = start;
            arr[4] = end;
            arr[5] = '<%: Session["WDID"] %>';
            arr[6] = custart;
            arr[7] = cusend;
            $.ajax({
                type: "POST",
                url: "ShiftMgt.aspx/saveNewShift",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ _arr: arr }),
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    //displayEmpShift($('#modalteamempid').val());
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            })
        }

        function cancelShift(empshiftid)
        {
            var arr = new Array();
            arr[0] = empshiftid;
            $.ajax({
                type: "POST",
                url: "ShiftMgt.aspx/cancelShift",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify({ _arr: arr }),
                dataType: "json",
                success: function AjaxSucceeded(response) {
                    displayEmpShift($('#modalteamempid').val());
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
            });
        }

        <%--function insertTeamShifts(start, end, custart, cusend) {
            $("#gridStaffSched tr").each(function () {
                var checkBox = $(this).find("input[type='checkbox']");
                var teamempid = $(this).find("input[id$=hfTeamEmp]").val();
                var workdayid = $(this).find("td:nth-child(1)").html();
                if (workdayid != undefined) {
                    var arr = new Array();
                    arr[0] = teamempid;
                    arr[1] = $('#ddlTimeShiftT').val();
                    arr[2] = $('#ddlDayShiftT').val();
                    arr[3] = start;
                    arr[4] = end;
                    arr[5] = '<%: Session["WDID"] %>';
                    arr[6] = custart;
                    arr[7] = cusend;
                    $.ajax({
                        type: "POST",
                        url: "ShiftMgt.aspx/saveNewShift",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ _arr: arr }),
                        dataType: "json",
                        success: AjaxSucceeded,
                        error: AjaxError,
                        failure: AjaxFailure
                    });

                    function AjaxSucceeded(response) {
                        //alert(response.d);
                        displayEmpShift($('#hfteamempid').val());
                        //$("#startdate").datepicker("option", "maxDate", null);
                        clearAll();
                    }
                    function AjaxError(response) {
                        alert(response.status + ' ' + response.statusText);
                    }
                    function AjaxFailure(response) {
                        alert(response.status + ' ' + response.statusText);
                    }
                }
            })
        }

        function insertTeamShift(start, end, custart, cusend) {
            $("#gridStaffSched tr").each(function () {
                var checkBox = $(this).find("input[type='checkbox']");
                var teamempid = $(this).find("input[id$=hfTeamEmp]").val();
                var workdayid = $(this).find("td:nth-child(1)").html();
                if (workdayid != undefined) {
                    if ($(checkBox).is(':checked')) {
                        var arr = new Array();
                        arr[0] = teamempid;
                        arr[1] = $('#ddlTimeShiftT').val();
                        arr[2] = $('#ddlDayShiftT').val();
                        arr[3] = start;
                        arr[4] = end;
                        arr[5] = '<%: Session["WDID"] %>';
                        arr[6] = custart;
                        arr[7] = cusend;
                        $.ajax({
                            type: "POST",
                            url: "ShiftMgt.aspx/saveNewShift",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify({ _arr: arr }),
                            dataType: "json",
                            success: AjaxSucceeded,
                            error: AjaxError,
                            failure: AjaxFailure
                        });

                        function AjaxSucceeded(response) {
                            //alert(response.d);
                            //displayEmpShift($('#hfteamempid').val());
                            //$("#startdate").datepicker("option", "maxDate", null);
                            clearAll();
                        }
                        function AjaxError(response) {
                            alert(response.status + ' ' + response.statusText);
                        }
                        function AjaxFailure(response) {
                            alert(response.status + ' ' + response.statusText);
                        }
                    }
                }
            })
        }--%>

        

    </script>
</asp:Content>
