<%@ Page Title="OPT" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Eve.aspx.cs" Inherits="MBPS_Central.OPT.Eve" %>
<%-- TO DO ON THIS PAGE

    VALIDATION OF FORMS
    LINK BUTTON TO DISPLAY PREVIOUS MONTHS DATA
    BUTTON TO REFRESH PER GRIDVIEW
    RESET FORMS AFTER CLICKING START
    HOW TO INSTRUCTIONS
    
--%>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>
    <style>
        a {
            color: #333;
        }

        .dropdown a {
            color: #fff;
        }
         #myModaleditWT .modal-dialog  {
             width:75%;
         }
        #keytitle {
            font-size: 17px;
        }

        #gridPrevious > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridPrevious > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridProcess > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridProcess > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridActiveNPT > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridActiveNPT > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color:#333;
        }

        #gridPrevNPT > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridPrevNPT > tbody > tr:first-child {
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
                <h1 class="page-header"><i class="fa fa-tasks fa-fw"></i>OPT</h1>
                <div class="panel-heading">
                    Processing and Non-processing Tracker
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
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <ul class="nav nav-tabs mbps">
                            <li class="active"><a href="#proc-pills" data-toggle="tab">Processing  <span id="countAct"></span></a>
                            </li>
                            <li><a href="#npt-pills" data-toggle="tab">NPT <span id="nptcount"></span></a>
                            </li>
                            <li><a href="#howto-pills" data-toggle="tab">How to Instructions</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="proc-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 id="proc4">Processing</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div id="procFORM">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Parent Worktype</label>
                                                    <asp:DropDownList
                                                        ID="ddlParent"
                                                        runat="server"
                                                        CssClass="form-control"
                                                        AppendDataBoundItems="false"
                                                        ClientIDMode="Static">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Worktypes</label>
                                                    <asp:DropDownList
                                                        ID="ddlWorktypes"
                                                        runat="server"
                                                        CssClass="form-control"
                                                        ClientIDMode="Static">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Count/Volume</label>
                                                    <input id="txtCount" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Reference No. / Reference ID </label>
                                                    <input id="txtref" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="form-group">
                                                    <label>Disposition</label>
                                                    <input id="txtdis" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group">
                                                    <label>Remarks</label>
                                                    <textarea id="txtRemarks" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Actions</label>
                                                    <div class="clearfix"></div>
                                                    <div class="pull-right">
                                                        <button id="btnprocclear" type="button" class="btn btn-success"><i class="fa fa-eraser fa-fw"></i>Clear</button>
                                                        <button id="btnprocstart" type="button" class="btn btn-success"><i class="fa fa-play fa-fw"></i>Start</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <hr />
                                        <ul class="nav nav-tabs mbps">
                                            <li class="active"><a href="#active-pills" data-toggle="tab">Active</a>
                                            </li>
                                            <li><a href="#previous-pills" data-toggle="tab">Previous</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <%-- Active Entries Grid View --%>
                                            <div class="tab-pane fade in active" id="active-pills">
                                                <div class="table-responsive">
                                                    <label>Active Entries </label>
                                                    <table id="gridProcess" class="table table-bordered dataTable no-footer">
                                                        <thead>
                                                            <tr>
                                                                <th>Worktype</th>
                                                                <th>Reference</th>
                                                                <th>Volume</th>
                                                                <th>Start</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>
                                            <%-- Stop Modal --%>
                                            <div class="modal fade" id="stopModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="stopModalh4"><span id="stopModalspan">Entry Details</span></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Associate Name </label>
                                                                    <p id="txtDetName" class="form-control-static"></p>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Start</label>
                                                                    <p id="txtDetStart" class="form-control-static"></p>
                                                                </div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Parent Worktype</label>
                                                                    <asp:DropDownList
                                                                        ID="ddlDetPW"
                                                                        runat="server"
                                                                        CssClass="form-control"
                                                                        AppendDataBoundItems="false"
                                                                        ClientIDMode="Static">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Worktypes</label>
                                                                    <input type="hidden" id="tmpWTID" />
                                                                    <asp:DropDownList
                                                                        ID="ddlDetWT"
                                                                        runat="server"
                                                                        CssClass="form-control"
                                                                        ClientIDMode="Static">
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Reference No. / Reference ID </label>
                                                                    <input id="txtDetRef" class="form-control" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label>Count/Volume</label>
                                                                    <input id="txtDetCount" class="form-control" />
                                                                </div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                            <div class="col-sm-4">
                                                                <div class="form-group">
                                                                    <label>Disposition</label>
                                                                    <input id="txtDetDis" class="form-control" />
                                                                </div>
                                                            </div>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label>Remarks</label>
                                                                    <textarea id="txtDetRemarks" class="form-control"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                            <button id="runsave" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-save fa-fw"></i>Save Details</button>
                                                            <input id="wtmid" type="hidden" />
                                                            <button id="stopsave" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-stop fa-fw"></i>Stop and Save</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <%-- Previous Entries of CURRENT MONTH ONLY Grid View --%>
                                            <div class="tab-pane fade" id="previous-pills">
                                                <div class="table-responsive">
                                                    <label>Previous Entries</label>
                                                    <table id="gridPrevious" class="table table-bordered dataTable no-footer">
                                                        <thead>
                                                            <tr>
                                                                <th>Worktype</th>
                                                                <th>Reference</th>
                                                                <th>Volume</th>
                                                                <th>Start</th>
                                                                <th>End</th>
                                                                <th>Elapsed</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <%-- Details Modal --%>
                                            <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title" id="parentModalx"><span id="WTtitle">Worktype</span></h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <dl>
                                                                <dt>Employee Name</dt>
                                                                <dd id="lblname"></dd>
                                                                <dt>Parent Worktype</dt>
                                                                <dd id="lblpworktype"></dd>
                                                                <dt>Worktype</dt>
                                                                <dd id="lblworktype"></dd>
                                                                <dt>Count / Volume</dt>
                                                                <dd id="lblcount"></dd>
                                                                <dt>Reference #</dt>
                                                                <dd id="lblref"></dd>
                                                                <dt>Disposition</dt>
                                                                <dd id="lbldis"></dd>
                                                                <dt>Remarks</dt>
                                                                <dd id="lblremarks"></dd>
                                                                <dt>Status</dt>
                                                                <dd id="lblactive"></dd>
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
                                </div>
                                <%--<div class="modal fade" id="myModaleditWT" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="editWTModalx"><span id="editWTtitle">Update Worktype</span></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="panel-body">
                                                    <div class="col-md-12">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label>Employee</label>
                                                                <label id="lblemployee"></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-5">
                                                            <div class="form-group">
                                                                <label>Parent Worktype</label>
                                                                <select id="ddlpwt" class="form-control"></select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Worktype</label>
                                                                <select id="ddlwt" class="form-control"></select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <div class="col-md-16">
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>Count / Volume</label>
                                                                <label id="lblvol"></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label>Reference </label>
                                                                <input id="txtreference" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-1">
                                                            <div class="form-group">
                                                                <label>Active</label>
                                                                <input type="checkbox" id="chkactive" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>Elapsed</label>
                                                                <label id="lblelapsed"></label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <div class="form-group">
                                                                <label>Disposition</label>
                                                                <input id="txtdisposition" class="form-control" />
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="clearfix"></div>
                                                    <div class="col-md-5">
                                                        <div class="form-group">
                                                            <label>Remarks</label>
                                                            <textarea rows="2" id="txtremarks" class="form-control"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <hr />
                                                    <h4>START TIME</h4>
                                                    <div class="col-md-15">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label>Date</label>
                                                                <input id="sDate" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>Hours</label>
                                                                <input id="sHour" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label>Minutes</label>
                                                                <input id="sMin" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>Seconds</label>
                                                                <input id="sSecs" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>AM/PM</label>
                                                                <select id="sAmPm" class="form-control">
                                                                    <option>AM</option>
                                                                    <option>PM</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="clearfix"></div>

                                                    <h4>END TIME</h4>
                                                    <div class="col-md-15">
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label>Date</label>
                                                                <input id="eDate" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>Hours</label>
                                                                <input id="eHour" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <div class="form-group">
                                                                <label>Minutes</label>
                                                                <input id="eMin" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>Seconds</label>
                                                                <input id="eSecs" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-2">
                                                            <div class="form-group">
                                                                <label>AM/PM</label>
                                                                <select id="eAmPm" class="form-control">
                                                                    <option>AM</option>
                                                                    <option>PM</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="pull-right">
                                                    <button id="btncancel" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-remove fa-fw"></i>Cancel</button>
                                                    <button id="btneditparent" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-save fa-fw"></i>Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                
                            </div>
                            <div class="tab-pane fade" id="npt-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Non Processing Time</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div id="nptFORM">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Non Processing Task</label>
                                                    <select id="ddltask" class="form-control"></select>
                                                </div>
                                            </div>
                                            <div class="col-sm-8">
                                                <div class="form-group">
                                                    <label>Remarks</label>
                                                    <textarea id="txRemarks" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div class="pull-right">
                                                        <label>Actions</label>
                                                        <div class="clearfix"></div>
                                                        <button id="btnnptclear" type="button" class="btn btn-success"><i class="fa fa-eraser fa-fw"></i>Clear</button>
                                                        <button id="btnnptstart" type="button" class="btn btn-success"><i class="fa fa-play fa-fw"></i>Start</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <hr />
                                        <ul class="nav nav-tabs mbps">
                                            <li class="active"><a href="#activenpt-pills" data-toggle="tab">Active</a>
                                            </li>
                                            <li><a href="#previousnpt-pills" data-toggle="tab">Previous</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade in active" id="activenpt-pills">
                                                <div class="table-responsive">
                                                    <label>Active NPT Entries</label>
                                                    <table id="gridActiveNPT" class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>Non Processing Task</th>
                                                                <th>Start</th>
                                                                <th>End</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody></tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="tab-pane fade" id="previousnpt-pills">
                                                <div class="table-responsive">
                                                    <label>Previous NPT Entries</label>
                                                    <table id="gridPrevNPT" class="table table-bordered">
                                                        <thead>
                                                            <tr>
                                                                <th>Non Processing Task</th>
                                                                <th>Start</th>
                                                                <th>End</th>
                                                                <th>Elapsed</th>
                                                                <th>Remarks</th>
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
                            <%-- How To --%>
                            <div class="tab-pane fade" id="howto-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>How to</h4>
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

                $('#btnnptstart').click(function () {
                    insertNptMetrics();
                })

                $('#btnprocstart').click(function () {
                    //modify this validation later - chippy 2/9/2015
                    if ($('#txtCount').val() == '') {
                        alert('Please input Count / Volume...');
                        $('#txtCount').focus();
                    }
                    else {
                        insertWorktypeMetrics();
                    }

                })
                $('#btnviewall').click(function () {
                    $('#gridPrevious').toggle("slow");
                    return true;
                })

                displayParentWT();
                displayWorktypeMetrics();
                displayWorktypeMetricsX();
                displayNPTtask();
                displayNPTMetrics();
                displayNPTMetricsX();

                $('#ddlParent').change(function () {
                    displayWorktype();
                })

                $('#ddlTeams').change(function () {
                    displayParentWT();
                    displayWorktypeMetrics();
                    displayWorktypeMetricsX();
                    displayNPTMetrics();
                    displayNPTMetricsX();
                })

                $('#runsave').click(function () {
                    saveRunStopMetric($(this).next().val(), true);
                })

                $('#stopsave').click(function () {
                    saveRunStopMetric($(this).prev().val(), false);
                })

                if ($('#gridActiveNPT tr').length > 1) { $('#btnnptstart').prop('disabled', true); } else { $('#btnnptstart').removeProp('disabled'); }
            })
        }

        //DISPLAY DROPDOWN LIST TO FORMS
        function displayNPTtask() {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayNPTtask",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {

                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var task = xml.find("Table1");
                    $.each(task, function () {
                        var task = $(this);
                        var o = new Option($(this).find("TaskName").text(), $(this).find("TaskID").text())
                        $(o).html($(this).find("TaskName").text());
                        $('#ddltask').append(o);
                    });
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        function displayParentWT() {
            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayParentWT",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    $("#ddlParent option").remove();
                    $("#ddlDetPW option").remove();
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var parents = xml.find("Table1");
                    $.each(parents, function () {
                        var parents = $(this);
                        var o = new Option($(this).find("ParentWorktypeName").text(), $(this).find("ParentWorktypeID").text())
                        $(o).html($(this).find("ParentWorktypeName").text());
                        $('#ddlParent').append(o);
                    });

                    $.each(parents, function () {
                        var parents = $(this);
                        var o = new Option($(this).find("ParentWorktypeName").text(), $(this).find("ParentWorktypeID").text())
                        $(o).html($(this).find("ParentWorktypeName").text());
                        $('#ddlDetPW').append(o);
                    });

                    displayWorktype();
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        function displayWorktype() {
            var arr = new Array();
            arr[0] = $('#ddlParent').val();
            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayWorktype",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    $("#ddlWorktypes option").remove();
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var worktype = xml.find("Table1");
                    $.each(worktype, function () {
                        var worktype = $(this);
                        var o = new Option($(this).find("WorktypeName").text(), $(this).find("WorktypeID").text())
                        $(o).html($(this).find("WorktypeName").text());
                        $('#ddlWorktypes').append(o);
                    });
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
            
        //RESUME AND PAUSE Processing Entries
        function resumeMetric(wtypemetricid) {
            var arr = new Array();
            arr[0] = wtypemetricid;
            arr[1] = '<%: Session["WDID"] %>';
            $.ajax({
                type: "POST",
                url: "Eve.aspx/resumeWtypeMetric",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    displayWorktypeMetrics()
                    displayNPTMetrics();
                    displayNPTMetricsX();
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        function pauseMetric(wtypemetricid) {
            var arr = new Array();
            arr[0] = wtypemetricid;
            $.ajax({
                type: "POST",
                url: "Eve.aspx/pauseWtypeMetric",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    displayWorktypeMetrics()
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        //STOP Non Processing Entry
        function stopNptMetric(taskid) {
            var arr = new Array();
            arr[0] = taskid;
            arr[1] = '<%: Session["WDID"] %>';
            $.ajax({
                type: "POST",
                url: "Eve.aspx/stopNptMetric",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    displayWorktypeMetrics();
                    displayNPTMetrics();
                    displayNPTMetricsX();
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }


        // START Processing function
        function insertWorktypeMetrics() {
            var arr = new Array();
            arr[0] = $('#ddlWorktypes').val();
            arr[1] = '<%: Session["WDID"] %>';
            arr[2] = $('#txtCount').val();
            arr[3] = $('#txtref').val();
            arr[5] = $('#txtdis').val();
            arr[4] = $('#txtRemarks').val();

            $.ajax({
                type: "POST",
                url: "Eve.aspx/saveWorktypeMetrics",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayWorktypeMetrics();
                displayNPTMetrics();
                displayNPTMetricsX();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        // DISPLAY Active Entries
        function displayWorktypeMetrics() {

            $('#gridProcess').dataTable().fnDestroy();
            $('#gridProcess > tbody > tr').remove();

            var arr = new Array();
            arr[0] = '<%: Session["WDID"] %>';

            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayWorktypeMetrics",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var rcount = 0;
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var metrics = xml.find("Table1");
                    $.each(metrics, function () {
                        var metrics = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("WorktypeName").text() + '</td> <td>';
                        col += $(this).find("Reference").text() + '</td> <td>';
                        col += $(this).find("Count").text() + '</td> <td>';
                        col += moment($(this).find("TimeStart").text()).format('MM/DD/YYYY HH:mm:ss A') + '</td> <td>';
                        var tmp = moment($(this).find("TimeEnd").text()).format('MM/DD/YYYY HH:mm:ss A');
                        if (tmp === 'Invalid date')
                        {
                            if ($(this).find("IsPaused").text() === 'true') {
                                col += '<input id="worktypemetricsid" type="hidden" value="' + $(this).find("WorktypeMetricsID").text() + '" /> <a id="resumeMetric" class="resumeMetric" href="#"><i class="fa fa-play fa-fw"></i>Resume</a> <br/> <input id="worktypemetricsid" type="hidden" value="' + $(this).find("WorktypeMetricsID").text() + '" /> <a id="stopMetric" class="stopMetric" data-toggle="modal" data-target="#stopModal" href="#"><i class="fa fa-stop fa-fw"></i>Stop</a>';
                            }
                            else {
                                col += '<input id="worktypemetricsid" type="hidden" value="' + $(this).find("WorktypeMetricsID").text() + '" /> <a id="pauseMetric" class="pauseMetric" href="#"><i class="fa fa-pause fa-fw"></i>Pause</a> <br/> <input id="worktypemetricsid" type="hidden" value="' + $(this).find("WorktypeMetricsID").text() + '" /> <a id="stopMetric" class="stopMetric" data-toggle="modal" data-target="#stopModal" href="#"><i class="fa fa-stop fa-fw"></i>Stop</a>';
                            }
                            
                        } else { col += tmp + '</td>'; }
                        
                        rcount += 1;
                        $("[id*=gridProcess] tbody").append($(row).append(col));
                    })

                    $('.pauseMetric').click(function () {
                        pauseMetric($(this).prev().val());
                    })

                    $('.resumeMetric').click(function () {
                        resumeMetric($(this).prev().val());
                    })

                    $('.stopMetric').click(function () {
                        detailsToStop($(this).prev().val());
                    })

                    $("#gridProcess").dataTable({
                        "order": [[3, "asc"]]
                    });

                    //$('html, body').animate({ scrollTop: $("#proc4").offset().top }, 1000);
                    if (rcount > 0) {
                        $('#countAct').html('(' + rcount + ')');
                    } else { $('#countAct').html(''); }
                    
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });

        }

        //DISPLAY Previous Entries of the current month only!
        function displayWorktypeMetricsX() {

            $('#gridPrevious').dataTable().fnDestroy();
            $('#gridPrevious > tbody > tr').remove();
            
            var arr = new Array();
            arr[0] = '<%: Session["WDID"] %>';

            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayWorktypeMetricsX",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var metrics = xml.find("Table1");
                    $.each(metrics, function () {
                        var metrics = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("WorktypeName").text() + '</td> <td>';
                        col += $(this).find("Reference").text() + '</td> <td>';
                        col += $(this).find("Count").text() + '</td> <td>';
                        col += moment($(this).find("TimeStart").text()).format('MM/DD/YYYY HH:mm:ss A') + '</td> <td>';
                        var tmp = moment($(this).find("TimeEnd").text()).format('MM/DD/YYYY HH:mm:ss A');
                        if (tmp === 'Invalid date') { col += '' + '</td> <td>'; } else { col += tmp + '</td> <td>'; }

                        col += $(this).find("Elapsed").text() + '</td> <td>';
                        col += '<input id="worktypemetricsid" type="hidden" value=' + $(this).find("WorktypeMetricsID").text() + ' /> <a id="viewDetail" class="viewDetail" data-toggle="modal" data-target="#detailModal"  href="#"><i class="fa fa-search fa-fw"></i>View Details</a>';

                        $("[id*=gridPrevious] tbody").append($(row).append(col));
                    });

                    $("#gridPrevious").dataTable({
                        "order": [[3, "asc"]]
                    });

                    $('.viewDetail').click(function (event) {
                        alert('x');
                    })
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        //DISPLAY Entry Details to RUN OR STOP -> SAVE
        function detailsToStop(entryid)
        {
            var arr = new Array();
            arr[0] = entryid;

            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayEntryDetails",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var details = xml.find("Table1");
                    $.each(details, function () {
                        var metrics = $(this);
                        $('#wtmid').val(entryid);
                        $('#txtDetName').html($(this).find("Name").text());
                        $('#txtDetStart').html(moment($(this).find("TimeStart").text()).format('MM/DD/YYYY HH:mm:ss A'));
                        $('#txtDetRef').val($(this).find("Ref").text());
                        $('#txtDetCount').val($(this).find("Count").text());
                        $('#txtDetDis').val($(this).find("Disposition").text());
                        $('#txtDetRemarks').val($(this).find("Remarks").text());
                        $('select[id="ddlDetPW"] option[value=' + $(this).find("TeamParentWorktypeID").text() + ']').prop('selected', true);
                        displayWorktypeDET($(this).find("TeamParentWorktypeID").text(), $(this).find("TeamWorktypeID").text());
                        $('#ddlDetWT').val($('#tmpWTID').val());
                    });
                    
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            })
        }
       
        //FUNCTION Entry to RUN OR STOP -> SAVE
        function saveRunStopMetric(wtypemetricid, run)
        {
            var arr = new Array();
            arr[0] = wtypemetricid;
            arr[1] = $('#ddlDetWT').val();
            arr[2] = $('#txtDetRef').val();
            arr[3] = $('#txtDetCount').val();
            arr[4] = $('#txtDetDis').val();
            arr[5] = $('#txtDetRemarks').val();
            arr[6] = run;
            $.ajax({
                type: "POST",
                url: "Eve.aspx/saveRunStopMetric",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    displayWorktypeMetrics();
                    displayWorktypeMetricsX();
                    displayNPTMetrics();
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        //FUNCTION TO DISPLAY WorktypeMetrics to EDIT
        function displayWorktypeDET(PWID, TWID) {
            $("#ddlDetWT option").remove();
            var arr = new Array();
            arr[0] = PWID;
            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayWorktype",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    //alert(response.d);
                    
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var worktype = xml.find("Table1");
                    $.each(worktype, function () {
                        var worktype = $(this);
                        var o = new Option($(this).find("WorktypeName").text(), $(this).find("WorktypeID").text())
                        $(o).html($(this).find("WorktypeName").text());
                        $('#ddlDetWT').append(o);
                    });

                    $('select[id="ddlDetWT"] option[value=' + TWID + ']').prop('selected', true);
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
        
        // START NPT function
        function insertNptMetrics() {
            var arr = new Array();
            arr[0] = $('#ddltask').val();
            arr[1] = '<%: Session["WDID"] %>';
            arr[2] = $('#txRemarks').val();

            $.ajax({
                type: "POST",
                url: "Eve.aspx/saveNPTMetrics",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayWorktypeMetrics();
                displayWorktypeMetricsX();
                displayNPTMetrics();
                displayNPTMetricsX();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };

        //DISPLAY Active NPT Entries
        function displayNPTMetrics() {

            //$('#gridActiveNPT').dataTable().fnDestroy();
            $('#gridActiveNPT > tbody > tr').remove();

            var arr = new Array();
            arr[0] = '<%: Session["WDID"] %>';

            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayNPTMetrics",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var nptmetrics = xml.find("Table1");
                    $.each(nptmetrics, function () {
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("TaskName").text() + '</td> <td>';
                        col += moment($(this).find("TimeStart").text()).format('MM/DD/YYYY HH:mm:ss A') + '</td> <td>';
                        var tmp = moment($(this).find("TimeEnd").text()).format('MM/DD/YYYY HH:mm:ss A');
                        if (tmp === 'Invalid date')
                        { col += "<input id='nptmetricsid' type='hidden' value='" + $(this).find("NonProcessMetricsID").text() + "' /><a id='stopNptMetric' class='stopNptMetric' href='#'><i class='fa fa-stop fa-fw'></i>Stop</a>" + '</td>'; }
                        else { col += tmp + '</td>'; }
                        
                        //col += $(this).find("Elapsed").text() + '</td>';

                        $("[id*=gridActiveNPT] tbody").append($(row).append(col));
                    });

                    $('.stopNptMetric').click(function () {
                        stopNptMetric($(this).prev().val());
                    })

                    if ($('#gridActiveNPT tr').length > 1) { $('#btnnptstart').prop('disabled', true); $('#nptcount').html(' (1)') } else { $('#btnnptstart').removeProp('disabled'); $('#nptcount').html('') }
                    
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
            
            
        }

        //DISPLAY Previous NPT Entries
        function displayNPTMetricsX() {

            $('#gridPrevNPT').dataTable().fnDestroy();
            $('#gridPrevNPT > tbody > tr').remove();

            var arr = new Array();
            arr[0] = '<%: Session["WDID"] %>';

            $.ajax({
                type: "POST",
                url: "Eve.aspx/displayNPTMetricsX",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var nptmetrics = xml.find("Table1");
                    $.each(nptmetrics, function () {
                        var nptmetrics = $(this);
                        var row = '<tr></tr>';
                        var col = '<td>';

                        col += $(this).find("TaskName").text() + '</td> <td>';
                        col += moment($(this).find("TimeStart").text()).format('MM/DD/YYYY HH:mm:ss A') + '</td> <td>';
                        col += moment($(this).find("TimeEnd").text()).format('MM/DD/YYYY HH:mm:ss A') + '</td> <td>';
                        col += $(this).find("Elapsed").text() + '</td> <td>';
                        col += $(this).find("Remarks").text() + '</td>';

                        $("[id*=gridPrevNPT] tbody").append($(row).append(col));
                    });


                    $("#gridPrevNPT").dataTable({
                        "order": [[1, "asc"]]
                    });

                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        ////TEMPORARY REGION
        function stopMetric(wtypemetricid) {
            var arr = new Array();
            arr[0] = wtypemetricid;
            arr[1] = '<%: Session["WDID"] %>';
            $.ajax({
                type: "POST",
                url: "Eve.aspx/stopWtypeMetric",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    displayWorktypeMetrics();
                    displayWorktypeMetricsX();
                    displayNPTMetrics();
                    displayNPTMetricsX();
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

    </script>
</asp:Content>
