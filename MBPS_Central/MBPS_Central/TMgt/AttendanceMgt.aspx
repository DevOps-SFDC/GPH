<%@ Page Title="Staff Attendance" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AttendanceMgt.aspx.cs" Inherits="MBPS_Central.TMgt.AttendanceMgt" %>
<%-- TO DO ON THIS PAGE
    
    1 Put Absenteeism and Tardiness Review in single page - DONE
    2 Add Time Correction in Tardiness Review - DONE
    3 Put Waive functionality in Tardiness Review
    4 Save then extract to excel - DONE
    5 Create historical reports    
    6 Modify Saving Leaves Directly - DONE
    7 Fix Leave Date - DONE

--%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        #gridEmpShift > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridEmpShift > tbody > tr:first-child {
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

        #gridComplex > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridComplex > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridLeaves > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridLeaves > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridAttendance > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridAttendance > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridTardiness > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

         #gridTardiness > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridAIStaff > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridAIStaff > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        .table-responsive {
            overflow-x:hidden;
        }

        #corrModal > .modal-dialog {
            width:600px;
        }

        #reviewModal > .modal-dialog {
            width:1280px;
            font-size:small;
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
                <h1 class="page-header"><i class="fa fa-list-ol fa-fw"></i>Staff Attendance</h1>
                <div class="panel-heading">
                    Manage your team members' attendance
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
                                ClientIDMode="Static"
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
                            <li class="active"><a href="#leave-pills" data-toggle="tab">Leaves</a>
                            </li>
                            <li><a href="#att-pills" data-toggle="tab">Attendance Review</a>
                            </li>
                            <li><a href="#aim-pills" data-toggle="tab">Attendance Incentives</a>
                            </li>
                            <li><a href="#howto-pills" data-toggle="tab">How To Instructions</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="leave-pills">
                                <div id="attendance-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Leaves</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table id="gridLeaves" class="table table-bordered">
                                                <thead>
                                                    <tr>
                                                        <th>Employee</th>
                                                        <th>Leave</th>
                                                        <th>Date</th>
                                                        <th>Count</th>
                                                        <th>Reason</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>

                                        <div class="pull-right">
                                            <button id="addleaves" type="button" class="btn btn-success"><i class="fa fa-plus fa-fw"></i>Add New Entry</button>
                                        </div>
                                        <div class="clearfix"></div>
                                        
                                        <div id="leaveform" style="display:none;">
                                            <hr />
                                            <div class="col-md-4 form-group">
                                                <div class="form-group">
                                                    <label>Staff</label>
                                                    <asp:DropDownList
                                                        ID="ddlStaff"
                                                        runat="server"
                                                        CssClass="form-control"
                                                        AppendDataBoundItems="true"
                                                        ClientIDMode="Static">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <div class="form-group">
                                                    <label>Leave Type</label>
                                                    <select id="ddlLeaveType" class="form-control">
                                                        <option>Select Leave Type...</option>
                                                        <option id="EL">Emergency Leave</option>
                                                        <option id="SL">Sick Leave</option>
                                                        <option id="VL">Vacation Leave</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-4 form-group">
                                                <div class="form-group">
                                                    <label>Leave Date</label>
                                                    <input id="leavedate" class="form-control dtpick">
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-4 form-group">
                                                <div class="form-group">
                                                    <label>Leave Count</label>
                                                    <input id="leavevolume" class="form-control dtpick" style="text-align: right">
                                                    <div class="clearfix"></div>
                                                    <div class="alert alert-success">
                                                        <p class="help-block"><i class="fa fa-info fa-fw"></i>Put 1 for whole day | Put 0.5 for half day</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-8 form-group">
                                                <div class="form-group">
                                                    <label>Reason</label>
                                                    <textarea id="leavereason" class="form-control" rows="2"></textarea>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="pull-right">
                                                <button id="addleave" type="button" class="btn btn-success"><i class="fa fa-plus fa-fw"></i>Add Employee Leave</button>
                                            </div>
                                        </div>
                                        <input id="hfteamempid" type="hidden" />
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="att-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Attendance Review</h4>
                                    </div>
                                    <div class="panel-body">
                                        <label>Staff List</label>
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
                                    </div>
                                </div>
                                <div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel"><span id="empname"></span></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="table-responsive">
                                                    <table id="gridComplex" class="table table-bordered dataTable no-footer">
                                                        <thead>
                                                            <tr>
                                                                <th>Date</th>
                                                                <th>Present</th>
                                                                <th>SL</th>
                                                                <th>EL</th>
                                                                <th>Reason</th>
                                                                <th>Shift</th>
                                                                <th>Time IN</th>
                                                                <th>Time OUT</th>
                                                                <th>Late</th>
                                                                <th>UT</th>
                                                                <th>OT</th>
                                                                <th>Waive Reason</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <p id="spJumpShift" class="text-danger"><strong>NO SHIFT ASSIGNED</strong></p><input id="modalTEID" type="hidden" /><input id="modalWDID" type="hidden" />
                                                <button id="btnJumpShift" type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalShiftForm">Create Shift</button>
                                                <button type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="corrModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="tardModalLabel"><span id="corrTitle"></span></h4>
                                                <input id="corrEmpID" type="hidden" />
                                            </div>
                                            <div class="modal-body">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Old Time </label><input id="DateCorr" type="hidden" />
                                                        <p id="txtCorrPrev" class="form-control-static"></p>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label>Corrected Time</label>
                                                        <input id="txtCorrNew" class="form-control dtimepicker" />
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Reason/Justification</label>
                                                        <textarea id="txtCorrReason" class="form-control" ></textarea>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                <button id="timeCorrect" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                                                <input id="corrLogType" type="hidden" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="modalShiftForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="ModalShiftFormTitle"><span id="modalShiftFormTitle"></span></h4>
                                                <input id="modalteamempid" type="hidden" />
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

                            <div class="tab-pane fade" id="aim-pills">
                                 <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Attendance Incentives Processing</h4>
                                    </div>
                                    <div class="panel-body">
                                        <label>Qualified Staffs for Attendance Incentive</label>
                                        <div class="pull-right">
                                            <button id="genAI" type="button" class="btn btn-success"><i class="fa fa-gears fa-fw"></i>Generate AI</button>
                                            <button id="xlAI" type="button" class="btn btn-success"><i class="fa fa-file-excel-o fa-fw"></i>Export</button>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="table-responsive">
                                            <table id="gridAIStaff" class="table table-bordered">
                                                <thead><tr><th>WorkdayID</th><th>Name</th><th>Instance of Leaves</th><th>Instance of Lates</th><th>Minutes of Lates</th><th>Qualified</th></thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                        <div class="table-responsive" style="display:none;">
                                            <asp:GridView
                                                ID="gridAI"
                                                runat="server"
                                                CssClass="table table-striped table-bordered"
                                                AutoGenerateColumns="false"
                                                ClientIDMode="Static">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="WorkdayID"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Last Name"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="First Name"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Position"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Department"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Date Hired"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="AI (%)"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Action"></asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="howto-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>How to Manage Attendance</h4>
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
        var ss = 'Select Staff...';
        var ls = 'Select Leave Type...';
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
            $("#leavedate").datepicker({
                changeMonth: false,
                changeYear: false,
                stepMonths: 0
            })

            $(document).ready(function () {
                $('#newshift-panel').hide();

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

                $('#btnChange').click(function () {
                    $('#definedshift').toggle();
                    $('#customshift').toggle();
                })

                $('.timepicker').timepicker({
                    timeFormat: 'hh:mm tt'
                });

                $('#btnJumpShift').click(function () {
                    $('#newshift-panel').hide();
                    displayEmpShift($('#modalTEID').val());
                })

                refreshDate();
                

                displayTeamStaff();
                $('#ddlTeams').change(function () {
                    displayTeamStaff();
                })

                var currD = new Date();
                $('#ddlMonthYear').val((currD.getMonth() + 1) + "/" + 1 + "/" + currD.getFullYear() + " 12:00:00 AM");

                $('#addleaves').click(function () {
                    if ($('#leaveform').is(':hidden')) {
                        $('#leaveform').slideDown();
                        $(this).html('<i class="fa fa-minus fa-fw"></i>Cancel Entry');
                        $.scrollTo($('#leaveform'), 1000);
                    }
                    else {
                        $('#leaveform').slideUp();
                        $(this).html('<i class="fa fa-plus fa-fw"></i>Add New Entry');
                        clearLeaveForm();
                    }
                })

                $('#saveleaves').click(function () {
                    insertLeaves();
                })

                $("#ddlTeams").change(function(){
                    displayLeaves();
                })

                $('.dtimepicker').datetimepicker({
                    timeFormat: 'hh:mm tt'
                })

                $("#ddlMonthYear").change(function () {
                    displayLeaves();
                    $('#leavedate').val('');
                    $("#leavedate").datepicker("destroy");
                    var tmp = $(this);
                    var dt = new Date(tmp.val())
                    if (tmp.val() == "")
                    {
                        $("#leavedate").datepicker({
                            changeMonth: false,
                            changeYear: false,
                            stepMonths: 0
                        })
                    }
                    else {
                        $("#leavedate").datepicker({
                            changeMonth: false,
                            changeYear: false,
                            stepMonths: 0,
                            defaultDate: dt.toLocaleDateString()
                        })
                    }
                })

                function clearLeaveForm()
                {
                    $('.dtpick').val('');
                    $('#ddlStaff').val(ss);
                    $('#ddlLeaveType').val(ls);
                    $('#leavereason').val('');

                    $("#ddlStaff").parent().removeClass('has-error');
                    $("#ddlLeaveType").parent().removeClass('has-error');
                    $("#leavedate").parent().removeClass('has-error');
                    $("#leavevolume").parent().removeClass('has-error');
                    $("#leavereason").parent().removeClass('has-error');
                }

                function validateLeaves(teamempid, leavedate)
                {
                    var valid = true;
                    
                    if (!$("#ddlStaff option:selected").index() > 0) {
                        $("#ddlStaff").parent().addClass('has-error');
                        valid = false;
                    }
                    else {
                        $("#ddlStaff").parent().removeClass('has-error');
                    }
                    
                    if (!$("#ddlLeaveType option:selected").index() > 0) {
                        $("#ddlLeaveType").parent().addClass('has-error');
                        valid = false;
                    }
                    else {
                        $("#ddlLeaveType").parent().removeClass('has-error');
                    }
                    
                    if (!$('#leavedate').val()) {
                        $("#leavedate").parent().addClass('has-error');
                        valid = false;
                    }
                    else {
                        $("#leavedate").parent().removeClass('has-error');
                    }

                    if (!$('#leavevolume').val()) {
                        $("#leavevolume").parent().addClass('has-error');
                        valid = false;
                    }
                    else {
                        $("#leavevolume").parent().removeClass('has-error');
                    }

                    if (!$('#leavereason').val()) {
                        $("#leavereason").parent().addClass('has-error');
                        valid = false;
                    }
                    else {
                        $("#leavereason").parent().removeClass('has-error');
                    }

                    if (valid) {
                        $("#gridLeaves tr").each(function () {
                            var hiddenfield = $(this).find("input[type='hidden']");
                            var datefield = $('td:nth-child(3)', this).text()
                            if (teamempid == hiddenfield.val() && leavedate == datefield) {
                                $("#leavedate").parent().addClass('has-error');
                                $("#ddlStaff").parent().addClass('has-error');
                                valid = false;
                            }
                            else {
                                $("#leavedate").parent().removeClass('has-error');
                                $("#ddlStaff").parent().removeClass('has-error');
                            }
                        })
                    }

                    return valid;
                }

                $('#addleave').click(function () {

                    if (validateLeaves($('#ddlStaff').val(), $('#leavedate').val())) {
                        insertLeaves();
                        clearLeaveForm();
                    }
                    
                })

                $('#gridLeaves tr').hover(function () {
                    var tmp = $(this).children("td").text()
                    if ($(this).index() > 0 && isNaN(tmp)) {
                        $(this).css('cursor', 'pointer');
                    }
                })

                $('#genAI').click(function () {
                    displayAIQualify();
                })

                $('#timeCorrect').click(function () {
                    
                    timeCorrection($('#corrLogType').val());
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

                $('#xlAI').click(function () {
                    test();
                })

                displayLeaves();
            })

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

            function refreshDate() {
                $("#startdate").datepicker("destroy");
                $("#enddate").datepicker("destroy");

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

            function sortTable(table, order) {
                var asc = order === 'asc',
                    tbody = table.find('tbody');

                tbody.find('tr').sort(function (a, b) {
                    if (asc) {
                        return $('td:nth-child(6)', a).text().localeCompare($('td:nth-child(6)', b).text());
                    } else {
                        return $('td:nth-child(6)', b).text().localeCompare($('td:nth-child(6)', a).text());
                    }
                }).appendTo(tbody);
            }

            function clearLeaveList()
            {
                var row = $("[id*=gridLeaves] tr:last-child").clone(true);
                $('#gridLeaves tr').not(function () { if ($(this).has('th').length) { return true } }).remove();
                $("td", row).eq(0).html('');
                $("td", row).eq(1).html('');
                $("td", row).eq(2).html('');
                $("td", row).eq(3).html('');
                $("td", row).eq(4).html('');
                $("td", row).eq(5).html('');
                $("[id*=gridLeaves]").append(row);
            }

            function displayTeamStaff() {
                $('#gridStaff > tbody > tr').remove();

                var arr = new Array();
                arr[0] = $("#ddlTeams").val();
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/getTeamStaff",
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
                            col += '<input type="hidden" value="' + $(this).find("TeamEmpID").text() + '" /><a class="reviewComplex" href="#" data-toggle="modal" data-target="#reviewModal" class="review-att"><i class="fa fa-search fa-fw"></i>Attendance Review</a> <input type="hidden" value="' + $(this).find("WorkdayID").text() + '" />';

                            $("#gridStaff > tbody").append($(row).append(col));
                        });
                        
                        $('.reviewComplex').click(function (event) {
                            $('#empname').text('(' + $(this).next().val() + ') ' + $(this).parent().prev().text() + ' - Attendance for ' + $('#ddlMonthYear option:selected').text());
                            $('#corrEmpID').val($(this).next().val());
                            $('#modalTEID').val($(this).prev().val());
                            $('#modalWDID').val($(this).next().val());
                            $('#modalShiftFormTitle').text('(' + $(this).next().val() + ') ' + $(this).parent().prev().text() + ' - Shift');
                            displayReviewComplex($(this).next().val());
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

            function test()
            {
                var arr = new Array();
                arr[0] = $("#ddlMonthYear").val();
                arr[1] = $("#ddlTeams").val();
                arr[2] = $("#ddlTeams option:selected").text();
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/displayAIXport",
                    data: JSON.stringify({ _arr: arr }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function AjaxSucceeded(response) { },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                });

                var myWindow = window.open("<%: ResolveUrl("~/Export.aspx")%>", '', 'width=200, height=100');
            }

            function displayAIQualify()
            {
                $('#gridAIStaff > tbody > tr').remove();

                $('#gridStaff tbody > tr').each(function () {
                    var wdid = $(this).children().first().text();
                    if (wdid > 0 || wdid < 0) {
                        var arr = new Array();
                        arr[0] = wdid;
                        arr[1] = $("#ddlMonthYear").val();
                        arr[2] = $("#ddlTeams").val();

                        $.ajax({
                            type: "POST",
                            url: "AttendanceMgt.aspx/displayAIQualify",
                            data: JSON.stringify({ _arr: arr }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function AjaxSucceeded(response) {
                                var xmlDoc = $.parseXML(response.d);
                                var xml = $(xmlDoc);
                                var attendance = xml.find("Table1");
                                $.each(attendance, function () {
                                    var attendance = $(this);
                                    var row = '<tr></tr>';
                                    var col = '<td>';

                                    var abins = $(this).find("LeaveCount").text()
                                    var latins = $(this).find("LateInstance").text()
                                    var latemin = $(this).find("LateMinutes").text()
                                    col += $(this).find("WorkdayID").text() + '</td> <td>';
                                    col += $(this).find("FirstName").text() + ' ' + $(this).find("LastName").text() + '</td> <td>';
                                    col += $(this).find("LeaveCount").text() + '</td> <td>';
                                    col += $(this).find("LateInstance").text() + '</td> <td>';
                                    col += $(this).find("LateMinutes").text() + '</td> <td>';
                                    var qual = $(this).find("Qualifier").text();
                                    if (qual == 1) {
                                        col += 'Incomplete Logs' + '</td>';
                                    }
                                    else {
                                        if (qual) {
                                            if (abins > 0 || latins > 3 || latemin > 15) {
                                                col += 'No' + '</td>';
                                            }
                                            else {
                                                col += 'Yes' + '</td>';
                                            }
                                        }
                                        else {
                                            col += 'No Shift Defined' + '</td>';
                                        }
                                    }

                                    $("[id*=gridAIStaff] tbody").append($(row).append(col));
                                });
                            },
                            error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                            failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                        });
                    }
                });
            }

            function displayLeaves()
            {
                $('#gridLeaves > tbody > tr').remove();

                var arr = new Array();
                arr[0] = $("#ddlTeams").val();
                arr[1] = $("#ddlMonthYear").val();
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/displayLeaves",
                    data: JSON.stringify({ _arr: arr }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: AjaxSucceeded,
                    error: AjaxError,
                    failure: AjaxFailure
                });

                function AjaxSucceeded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var leaves = xml.find("Table1");
                    $.each(leaves, function () {
                        var leaves = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';
                        
                        col += "<input id='hfteamempid' type='hidden' value='" + $(this).find("TeamEmpID").text() + "' />" + $(this).find("Name").text() + '</td> <td>';
                        col += $(this).find("LeaveType").text() + '</td> <td>';
                        col += moment($(this).find("LeaveDate").text()).utcOffset(480).format('MM/DD/YYYY') + '</td> <td>';
                        col += $(this).find("LeaveVolume").text() + '</td> <td>';
                        col += $(this).find("LeaveReason").text() + '</td> <td>';
                        col += "<a id='cancelLeave' class='cancelLeave' href='#'><i class='fa fa-times fa-fw'></i>Cancel</a> <input id='leaveid' type='hidden' value='" + $(this).find("LeaveID").text() + "' />" + '</td>';
                        
                        $("[id*=gridLeaves] tbody").append($(row).append(col));
                    });

                    $('.cancelLeave').click(function () {
                        cancelLeaves($(this).next().val());
                    })
                }
                function AjaxError(response) {
                    alert(response.status + ' ' + response.statusText);
                }
                function AjaxFailure(response) {
                    alert(response.status + ' ' + response.statusText);
                }
            }

            function displayReviewComplex(workdayid)
            {
                $("#gridComplex").dataTable().fnDestroy();
                $("#gridComplex > tbody > tr").remove();

                var arr = new Array();
                arr[0] = workdayid;
                arr[1] = $('#ddlMonthYear').val();
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/displayComplex",
                    data: JSON.stringify({ _arr: arr }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function AjaxSucceeded(response) {
                        var xmlDoc = $.parseXML(response.d);
                        var xml = $(xmlDoc);
                        var attendance = xml.find("Table1");
                        $.each(attendance, function () {
                            var attendance = $(this);
                            var row = '<tr></tr>';
                            var col = '<td>';

                            col += moment($(this).find("Date").text()).utcOffset(480).format('MM/DD/YYYY') + '</td> <td>';
                            col += $(this).find("Present").text() + '</td> <td>';
                            col += $(this).find("SickLeave").text() + '</td> <td>';
                            col += $(this).find("EmergencyLeave").text() + '</td> <td>';
                            col += $(this).find("LeaveReason").text() + '</td> <td>';
                            
                            var _att = parseFloat($(this).find("Present").text()) + parseFloat($(this).find("SickLeave").text()) + parseFloat($(this).find("EmergencyLeave").text());
                            
                            switch (_att) {
                                case 0:
                                    col += 'Day Off' + '</td> <td>';
                                    col += 'Day Off' + '</td> <td>';
                                    col += 'Day Off' + '</td> <td>';
                                    col += '</td> <td>';
                                    col += '</td> <td>';
                                    col += '</td> <td>';
                                    col += '</td>';
                                    break;
                                case 1:
                                    col += $(this).find("TimeShift").text() + '</td> <td>';
                                    if ($(this).find("CORRTimeIN").text()) {
                                        col += '<a href="#" class="correctionIn" data-toggle="modal" data-target="#corrModal"><i class="fa fa-magic fa-fw"></i>' + moment($(this).find("CORRTimeIN").text()).utcOffset(480).format('hh:mm A') + '</a> <input type="hidden" value="' + $(this).find("CORRTimeIN").text() + '"></td> <td>';
                                    }
                                    else {
                                        col += '<a href="#" class="correctionIn" data-toggle="modal" data-target="#corrModal"><i class="fa fa-magic fa-fw"></i>' + moment($(this).find("Login").text()).utcOffset(480).format('hh:mm A') + '</a> <input type="hidden" value="' + $(this).find("Login").text() + '"></td> <td>';
                                    }
                                    if ($(this).find("CORRTimeOUT").text()) {
                                        col += '<a href="#" class="correctionOut" data-toggle="modal" data-target="#corrModal" ><i class="fa fa-magic fa-fw"></i>' + moment($(this).find("CORRTimeOUT").text()).utcOffset(480).format('hh:mm A') + '</a> <input type="hidden" value="' + $(this).find("CORRTimeOUT").text() + '"></td> <td>';
                                    }
                                    else {
                                        col += '<a href="#" class="correctionOut" data-toggle="modal" data-target="#corrModal" ><i class="fa fa-magic fa-fw"></i>' + moment($(this).find("LogOut").text()).utcOffset(480).format('hh:mm A') + '</a> <input type="hidden" value="' + $(this).find("LogOut").text() + '"></td> <td>';
                                    }
                                    
                                    col += $(this).find("Late").text() + '</td> <td>';
                                    col += $(this).find("UT").text() + '</td> <td>';
                                    col += $(this).find("OT").text() + '</td> <td>';
                                    col += $(this).find("WaiveReason").text() + '</td>';
                                    break;
                            }
                            $("[id*=gridComplex] tbody").append($(row).append(col));
                        })
                        $('.correctionIn').click(function () {
                            $('#corrTitle').text('Time IN Correction');
                            $('#txtCorrPrev').html(moment($(this).next().val()).utcOffset(480).format('MM/DD/YYYY hh:mm A'));
                            $('#DateCorr').val($(this).parent().parent().children('td:first-of-type').text());
                            if (moment($(this).next().val()).utcOffset(480).format('MM/DD/YYYY hh:mm A') == 'Invalid date') {
                                $('#txtCorrNew').val(moment($(this).parent().parent().children('td:first-of-type').text()).utcOffset(480).format('MM/DD/YYYY hh:mm A'));
                            }
                            else {
                                $('#txtCorrNew').val(moment($(this).next().val()).utcOffset(480).format('MM/DD/YYYY hh:mm A'));
                            }
                            $('#corrLogType').val(true);
                            $('#txtCorrReason').val('');
                        })
                        $('.correctionOut').click(function () {
                            $('#corrTitle').text('Time OUT Correction');
                            $('#txtCorrPrev').html(moment($(this).next().val()).utcOffset(480).format('MM/DD/YYYY hh:mm A'));
                            $('#DateCorr').val($(this).parent().parent().children('td:first-of-type').text());
                            if (moment($(this).next().val()).utcOffset(480).format('MM/DD/YYYY hh:mm A') == 'Invalid date') {
                                $('#txtCorrNew').val(moment($(this).parent().parent().children('td:first-of-type').text()).utcOffset(480).format('MM/DD/YYYY hh:mm A'));
                            }
                            else {
                                $('#txtCorrNew').val(moment($(this).next().val()).utcOffset(480).format('MM/DD/YYYY hh:mm A'));
                            }
                            
                            $('#corrLogType').val(false);
                            $('#txtCorrReason').val('');
                        })

                        if ($('#gridComplex > tbody > tr').length < 1) {
                            $('#btnJumpShift').show();
                            $('#spJumpShift').show();
                        }
                        else {
                            $('#btnJumpShift').hide();
                            $('#spJumpShift').hide();
                        }
                        
                        $("#gridComplex").dataTable();
                    },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                });

            }

            function displayAttendance(workdayid)
            {
                $("#gridAttendance").dataTable().fnDestroy();
                $("#gridAttendance > tbody > tr").remove();

                var arr = new Array();
                arr[0] = workdayid;
                arr[1] = $('#ddlMonthYear').val();
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/displayAttendance",
                    data: JSON.stringify({ _arr: arr }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function AjaxSucceeded(response) {
                        var xmlDoc = $.parseXML(response.d);
                        var xml = $(xmlDoc);
                        var attendance = xml.find("Table1");
                        $.each(attendance, function () {
                            var attendance = $(this);
                            var row = '<tr></tr>';
                            var col = '<td>';
                            var date = new Date();
                            date = new Date($(this).find("ELY").text())
                            col += date.localeFormat('MM/dd/yyyy') + '</td> <td>';
                            col += $(this).find("Araw").text() + '</td> <td>';
                            col += $(this).find("Present").text() + '</td> <td>';
                            col += $(this).find("SickLeave").text() + '</td> <td>';
                            col += $(this).find("EmergencyLeave").text() + '</td> <td>';
                            col += $(this).find("LeaveReason").text() + '</td>';
                            $("[id*=gridAttendance] tbody").append($(row).append(col));
                        })
                        $("#gridAttendance").dataTable();
                    },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                });
            }

            function displayTardiness(workdayid)
            {
                $('#gridTardiness').dataTable().fnDestroy();
                $('#gridTardiness > tbody > tr').remove();

                var arr = new Array();
                arr[0] = workdayid;
                arr[1] = $('#ddlMonthYear').val();

                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/displayTardiness",
                    data: JSON.stringify({ _arr: arr }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function AjaxSucceeded(response) {
                        var xmlDoc = $.parseXML(response.d);
                        var xml = $(xmlDoc);
                        var attendance = xml.find("Table1");
                        $.each(attendance, function () {
                            var attendance = $(this);
                            var row = '<tr></tr>';
                            var col = '<td>';
                            var date = new Date();
                            date = new Date($(this).find("Date").text())
                            col += date.localeFormat('MM/dd/yyyy') + '</td> <td>';
                            col += $(this).find("Day").text() + '</td> <td>';
                            
                            if (!$(this).find("TimeStamp").text()) {
                                col += 'Day Off' + '</td> <td>';
                                col += 'Day Off' + '</td> <td>';
                            } else {
                                col += $(this).find("TimeShift").text() + '</td> <td>';
                                col += $(this).find("TimeStamp").text() + '</td> <td>';
                            }
                            col += $(this).find("Late").text() + '</td> <td>';
                            col += $(this).find("UT").text() + '</td> <td>';
                            col += $(this).find("OT").text() + '</td>';
                            $("[id*=gridTardiness] tbody").append($(row).append(col));
                        })
                        $("#gridTardiness").dataTable();
                    },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
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
                arr[0] = $('#modalTEID').val();
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
                        displayEmpShift($('#modalTEID').val());
                        displayReviewComplex($('#modalWDID').val());
                    },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                })
            };

            function insertLeaves() {
                var arr = new Array();
                arr[0] = $('#ddlStaff').val();
                arr[1] = $('#ddlLeaveType option:selected').text();
                arr[2] = $('#leavedate').val();
                arr[3] = $('#leavevolume').val();
                arr[4] = $('#leavereason').val();
                arr[5] = '<%: Session["WDID"] %>';
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/saveLeaves",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ _arr: arr }),
                    dataType: "json",
                    success: function AjaxSucceeded(response) {},// $("#saveleaves").prop('disabled', true) },//alert(response.d) },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                })
                displayLeaves();
            }

            function cancelLeaves(leaveid)
            {
                var arr = new Array();
                arr[0] = leaveid;
                arr[1] = '<%: Session["WDID"] %>';
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/cancelLeaves",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ _arr: arr }),
                    dataType: "json",
                    success: function AjaxSucceeded(response) {
                        displayLeaves();
                    },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                })
            }

            function timeCorrection(logtype)
            {
                var arr = new Array();
                arr[0] = logtype; //Type of Correction
                arr[1] = $('#DateCorr').val(); //Date to be Corrected
                arr[2] = $('#txtCorrNew').val(); //Corrected Time
                arr[3] = '<%: Session["WDID"] %>'; //Corrected By
                arr[4] = $('#txtCorrReason').val(); //Reason for Correction
                arr[5] = $('#corrEmpID').val(); //Staff to be Corrected
                
                $.ajax({
                    type: "POST",
                    url: "AttendanceMgt.aspx/timeCorrection",
                    contentType: "application/json; charset=utf-8",
                    data: JSON.stringify({ _arr: arr }),
                    dataType: "json",
                    success: function AjaxSucceeded(response) {
                        //displayLeaves();
                        displayReviewComplex($('#corrEmpID').val());
                    },
                    error: function AjaxError(response) { alert(response.status + ' ' + response.statusText); },
                    failure: function AjaxFailure(response) { alert(response.status + ' ' + response.statusText); }
                })
            }
        }
    </script>
</asp:Content>
