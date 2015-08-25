<%@ Page Title="OPT Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EveSettings.aspx.cs" Inherits="MBPS_Central.OPT.EveSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="<%: ResolveUrl("~/Scripts/timepicker.js") %>"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-cogs fa-fw"></i>OPT Settings</h1>
                <div class="panel-heading">
                    Manage your OPT Configuration
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="col-md-6 form-group">
                            <label>Team Selection*</label>
                            <asp:DropDownList
                                ID="ddlTeams"
                                runat="server"
                                ClientIDMode="Static"
                                AutoPostBack="True"
                                CssClass="form-control" OnSelectedIndexChanged="ddlTeams_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="panel-body">
                        <ul class="nav nav-tabs mbps">
                            <li class="active"><a href="#parent-pills" data-toggle="tab">Parent Worktypes</a>
                            </li>
                            <li><a href="#work-pills" data-toggle="tab">Worktypes</a>
                            </li>
                            <%-- <li><a href="#spt-pills" data-toggle="tab">SPT</a>
                            </li>--%>
                            <li><a href="#npt-pills" data-toggle="tab">NPT Task</a>
                            </li>
                            <li><a href="#howto-pills" data-toggle="tab">How to Instructions</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="parent-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Add New Parent Worktype</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="clearfix"></div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Parent Worktype*</label>
                                                <input id="txtparent" class="form-control" />
                                            </div>

                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                            <div class="pull-right">
                                                <button id="btnaddparent" type="button" class="btn btn-success"><i class="fa fa-save fa-fw"></i>ADD</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="table-responsive" style="overflow: auto; height: 500px;">
                                    <asp:GridView
                                        ID="gridparent"
                                        runat="server"
                                        CssClass="table table-striped table-bordered"
                                        AutoGenerateColumns="false"
                                        ClientIDMode="Static">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Parent Worktype"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status"></asp:TemplateField>
                                            <asp:TemplateField HeaderText="Actions"></asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="modal fade" id="myModalParent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalparent"><span id="parenttitle">Edit Parent Worktype</span></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <dl>
                                                        <dt>Parent Worktype</dt>
                                                        <dd class="form-group">
                                                            <div class="col-md-8">
                                                                <input id="txteditparentid" class="form-control" type="hidden" />
                                                                <input id="txteditparent" class="form-control" />
                                                            </div>
                                                            <input type="checkbox" id="chkeditparent" />Active
                                                        </dd>
                                                        <dd></dd>
                                                    </dl>
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
                                </div>
                                <div class="modal fade" id="ParentViewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel1"><span id="parentviewtitle1">Parent Worktypes</span></h4>
                                            </div>
                                            <div class="modal-body">
                                                <dl>
                                                    <dt>Parent Worktype</dt>
                                                    <dd id="lblparent"></dd>
                                                    <dt>Active </dt>
                                                    <dd id="lblactive"></dd>
                                                    <dt>Created By</dt>
                                                    <dd id="lblcreated"></dd>
                                                    <dt>Created Date</dt>
                                                    <dd id="lblcdate"></dd>
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
                            <div class="tab-pane fade" id="work-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Manage Worktype</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Select Parent Worktype*</label>
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
                                                <label>Worktype Name*</label>
                                                <input id="txtworktype" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="clearfix"></div>
                                        <div class="panel-body">
                                            <label>Standard Processing Time (minutes)</label>
                                            <div class="clearfix"></div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Target Unit *</label>
                                                    <input id="txttu" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Business Unit * </label>
                                                    <input id="txtbu" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <div class="pull-right">
                                                <button id="btnnptclear" type="button" class="btn btn-success"><i class="fa fa-eraser fa-fw"></i>Clear</button>
                                                <button id="btnaddwoktype" type="button" class="btn btn-success"><i class="fa fa-save fa-fw"></i>ADD</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="table-responsive" style="overflow: auto; height: 500px;">
                                        <asp:GridView
                                            ID="gridworktype"
                                            runat="server"
                                            CssClass="table table-striped table-bordered"
                                            AutoGenerateColumns="false"
                                            ClientIDMode="Static">
                                            <Columns>
                                                <asp:BoundField HeaderText="Parent Worktype"></asp:BoundField>
                                                <asp:BoundField HeaderText="Worktype"></asp:BoundField>
                                                <asp:BoundField HeaderText="Status"></asp:BoundField>
                                                <asp:BoundField HeaderText="Volume"></asp:BoundField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <ItemTemplate>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="myModalLabel"><span id="worktypetitle">Standard Processing Time (SPT)</span></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="table-responsive">
                                                        <dl>
                                                            <dt>Month</dt>
                                                            <dd class="form-group">
                                                                <div class="col-md-4">
                                                                    <select id="ddlmonth" class="form-control"></select>
                                                                </div>
                                                            </dd>
                                                            <dt>Year</dt>
                                                            <dd class="form-group">
                                                                <div class="col-md-4">
                                                                    <select id="ddlyear" class="form-control"></select>
                                                                </div>
                                                            </dd>
                                                        </dl>
                                                        <div class="clearfix"></div>
                                                        <dl>

                                                            <dt id="spttitle"></dt>
                                                            <dd>
                                                                <asp:GridView
                                                                    ID="gridupdatespt"
                                                                    runat="server"
                                                                    CssClass="table table-striped table-bordered"
                                                                    AutoGenerateColumns="false"
                                                                    ClientIDMode="Static">
                                                                    <Columns>
                                                                        <asp:TemplateField HeaderText="Parent Worktype"></asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Worktype"></asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Business Unit (SPT BU)"></asp:TemplateField>
                                                                        <asp:TemplateField HeaderText="Target Unit (SPT TU)"></asp:TemplateField>
                                                                    </Columns>
                                                                </asp:GridView>
                                                            </dd>
                                                        </dl>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal fade" id="worktypeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="worktypeModalx"><span id="worktypetitle1">Worktypes</span></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <dl>
                                                        <dt>Parent Worktype </dt>
                                                        <dd id="lblpworktype"></dd>
                                                        <dt>Worktype</dt>
                                                        <dd id="lblworktype"></dd>
                                                        <dt>Active </dt>
                                                        <dd id="lblwtactive"></dd>
                                                        <dt>Created By</dt>
                                                        <dd id="lblwtcreated"></dd>
                                                        <dt>Created Date</dt>
                                                        <dd id="lblwtcdate"></dd>
                                                        <dt>Transaction Volume</dt>
                                                        <dd id="lblvolume"></dd>
                                                    </dl>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div id="updatespt">
                                        <div class="table-responsive">
                                            <asp:GridView
                                                ID="gridupdatespt1"
                                                runat="server"
                                                CssClass="table table-striped table-bordered"
                                                AutoGenerateColumns="false"
                                                ClientIDMode="Static">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Parent Worktype"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Worktype"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Business Unit (SPT BU)"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Target Unit (SPT TU)"></asp:TemplateField>

                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="myModalWT" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalWTx"><span id="WTttitle">Edit Worktype</span></h4>
                                            </div>
                                            <div class="modal-body">
                                                <dl>
                                                    <dt>Parent Worktype wtmodal</dt>
                                                    <dd>
                                                        <input id="txteditWTid" class="form-control" type="hidden" />
                                                        <select id="ddlparent" class="form-control"></select>
                                                    </dd>
                                                    <dt>Worktype</dt>
                                                    <dd>
                                                        <input id="txteditWT" class="form-control" /></dd>
                                                    <dt>Active</dt>
                                                    <dd>
                                                        <select id="ddlactive" class="form-control">
                                                            <option value="1">True</option>
                                                            <option value="0">False</option>
                                                              <option value="0">Not Set</option>
                                                        </select></dd>
                                                    <dt>Transaction Volume</dt>
                                                    <dd>
                                                        <select id="ddltransaction" class="form-control">
                                                            <option value="1">True</option>
                                                            <option value="0">False</option>
                                                             <option value="2">Not Set</option>
                                                        </select></dd>
                                                </dl>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="pull-right"></div>
                                                <button id="btnWTcancel" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-remove fa-fw"></i>Cancel</button>

                                                <button id="btnWTedit" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-save fa-fw"></i>Save</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="npt-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Add Non Proccessing Time (NPT)</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label>Task</label>
                                                <input id="txtnpt" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="clearfix"></div>
                                            <div class="pull-right">
                                                <button id="btnaddnpt" type="button" class="btn btn-success"><i class="fa fa-save fa-fw"></i>ADD</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <div class="table-responsive">
                                        <asp:GridView
                                            ID="gridnpt"
                                            runat="server"
                                            CssClass="table table-striped table-bordered"
                                            AutoGenerateColumns="false"
                                            ClientIDMode="Static">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Task Name"></asp:TemplateField>
                                                <asp:TemplateField HeaderText="Status"></asp:TemplateField>

                                                <asp:TemplateField HeaderText="Action"></asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                                <div class="modal fade" id="myModalNpt" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalNptx"><span id="nptttitle">Edit Non Processing Task</span></h4>
                                            </div>
                                            <div class="modal-body">
                                                <div class="table-responsive">
                                                    <dl>
                                                        <dt>Task</dt>
                                                        <dd class="form-group">
                                                            <div class="col-md-8">
                                                                <input id="txteditnptid" class="form-control" type="hidden" />
                                                                <input id="txteditnpt" class="form-control" />
                                                            </div>
                                                            <input type="checkbox" id="chkeditnpt" />Active
                                                        </dd>
                                                        <dd></dd>
                                                    </dl>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <div class="pull-right">
                                                    <button id="btnnptcancel" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-remove fa-fw"></i>Cancel</button>

                                                    <button id="btneditnpt" type="button" class="btn btn-success" data-dismiss="modal"><i class="fa fa-save fa-fw"></i>Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal fade" id="NPTModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="NPTModalx"><span id="npttitle">Non Proccessing Time (NPT)</span></h4>
                                            </div>
                                            <div class="modal-body">
                                                <dl>
                                                    <dt>Task Name</dt>
                                                    <dd id="lblnpt"></dd>
                                                    <dt>Active</dt>
                                                    <dd id="lblnptactive"></dd>
                                                    <dt>Created By </dt>
                                                    <dd id="lblnptcreated"></dd>
                                                    <dt>Created Date</dt>
                                                    <dd id="lblnptcreateddate"></dd>
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
                            <div class="tab-pane fade" id="howto-pills">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>How To</h4>
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
                //add parent worktype
                $("#ddlTeams").change(function () {
                    displayHeadcount();

                })
                $('#btnaddparent').click(function () {

                    if ($('#txtparent').val() == '') {
                        alert('Please input Parent Worktype Name...');
                        $('#txtparent').focus();
                    }
                    else {
                        insertParentWT();
                    }
                })
                //add worktype
                $('#btnaddwoktype').click(function () {
                    if ($('#txtworktype').val() == '') {
                        alert('Please Select Parent Worktype and input Worktype Name...');
                        $('#txtworktype').focus();
                    }
                    else {
                        insertWorktypes();
                    }
                })
                //add npt
                $('#btnaddnpt').click(function () {
                    if ($('#txtnpt').val() == '') {
                        alert('Please input Worktype...');
                        $('#txtnpt').focus();
                    }
                    else {
                        insertNptTask();
                    }

                })
                //update parent WT
                $('#btneditparent').click(function () {
                    updateParentWT();
                })
                //update worktype
                $('#btnWTedit').click(function () {
                    updateworktype();
                })
                //update NPT
                $('#btneditnpt').click(function () {
                    updateNPT();
                })
                displayparentMOdal();
                displayparentworktype();
                displayparentWT();
                displayworktype();
                displayNPT();
                chooseDate();

                //displayspt();

                //$('#ddlTeams').change(function () {
                //    displayparentMOdal();
                //    displayparentworktype();
                //    displayparentWT();
                //    displayworktype();
                //    displayNPT();
                //})
                $("#ddlTeams").change(function () {
                    displayparentMOdal();
                    displayparentworktype();
                    displayparentWT();
                    displayworktype();
                    displayNPT();
                })

            })
        }
        //UPDATE PARENT WORKTYPE MODAL
        function updateParentWT() {
            // var isChecked = $('#chkeditparent').attr('checked') ? true : false
            var arr = new Array();
            arr[0] = $('#txteditparentid').val();
            arr[1] = $('#txteditparent').val();

            arr[2] = $('#chkeditparent:checked').val() ? 1 : 0
            //$('#chkeditparent').val());

            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/updateParentWorktype",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayparentworktype();

                alert('saved')
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };
        //UPDATE WORKTYPE wtmodal
        function updateworktype() {
           
            var arr = new Array();
            arr[0] = $('#txteditWTid').val();
            arr[1] = $('#ddlparent').val();
            arr[2] = $('#txteditWT').val();
            arr[3] = $('#ddlactive').children(':selected').val();
            arr[4] = $('#ddltransaction').children(':selected').val();

            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/updateWorktype",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                
                displayworktype()
                alert('saved')
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };
        //UPDATE NPT MODAL
        function updateNPT() {
            // var isChecked = $('#chkeditparent').attr('checked') ? true : false
            var arr = new Array();
            arr[0] = $('#txteditnptid').val();
            arr[1] = $('#txteditnpt').val();

            arr[2] = $('#chkeditnpt:checked').val() ? 1 : 0
            //$('#chkeditparent').val());

            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/updateNPT",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayNPT();

                alert('saved')
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };

        //add parent worktype
        function insertParentWT() {

            var arr = new Array();
            arr[0] = $('#txtparent').val();
            arr[1] = $('#ddlTeams').val();

            arr[2] = '<%: Session["lanid"] %>';

            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/saveParentWorktype",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayparentworktype();
                displayparentWT();
                displayparentMOdal();
                $('#txtparent').val('').empty();
                alert('saved')
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };
        //add npt
        function insertNptTask() {

            var arr = new Array();
            arr[0] = $('#txtnpt').val();
            arr[1] = $('#ddlTeams').val();
            arr[2] = '<%: Session["lanid"] %>';

            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/saveNpttask",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayNPT();
                $('#txtnpt').val('').empty();
                alert('saved')
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.responseText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };
        //add worktype
        function insertWorktypes() {

            var arr = new Array();
            arr[0] = $('#ddlParent').val();
            arr[1] = $('#ddlTeams').val();
            arr[2] = $('#txtworktype').val();
            arr[3] = '<%: Session["lanid"] %>';

            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/saveWorktypes",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayworktype();
                $('#txtworktype').val('').empty();
                alert('save')
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.responseText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        };

        function chooseDate() {
            $("#startdate").datepicker({
                changeMonth: true,
                changeYear: true,

                onClose: function (selectedDate) {
                    $("#enddate").datepicker("option", "minDate", selectedDate);
                }
            });

            $("#enddate").datepicker({
                changeMonth: true,
                changeYear: true,

                onClose: function (selectedDate) {
                    $("#startdate").datepicker("option", "maxDate", selectedDate);
                }
            });
        }
   //display parent worktype dropdown
        function displayparentWT() {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/displayParentWT",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {

                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var parents = xml.find("Table1");
                    $.each(parents, function () {
                        var parents = $(this);
                        var o = new Option($(this).find("ParentWorktypeName").text(), $(this).find("ParentWorktypeID").text())
                        $(o).html($(this).find("ParentWorktypeName").text());
                        $('#ddlParent').append(o);
                    });


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
    //display parent worktype gridview
        function displayparentworktype() {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/displayParentWorktype",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    //$("#ddlParent option").remove();
                    //$("#gridparent option").remove();
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var Dparents = xml.find("Table1");
                    var row = $("[id*=gridparent] tr:last-child").clone(true);
                    $("[id*=gridparent] tr").not($("[id*=gridparent] tr:first-child")).remove();
                    $.each(Dparents, function () {
                        var Dparents = $(this);
                        //var x = new String();

                        $("td", row).eq(0).html("<input id='parentworktypeid' type='hidden' value='" + $(this).find("ParentWorktypeID").text() + "' />" + $(this).find("ParentWorktypeName").text());
                        x = new String($(this).find("IsActive").text());

                        if (x == 'true') {
                            $("td", row).eq(1).html(('Active'));
                        }
                        else {
                            $("td", row).eq(1).html(('InActive'));
                        }
                        // $("td", row).eq(1).html($(this).find("IsActive").text());
                        $("td", row).eq(2).html("<a id='editparent' class='editparent' data-toggle='modal' data-target='#myModalParent' href='#'><i class='fa fa-edit fa-fw'></i>Edit</a><input type='hidden' value='" + $(this).find("ParentWorktypeID").text() + "'/><input type='hidden' value='" + $(this).find("ParentWorktypeName").text() + "'/></br><a id='viewDetailparent' class='viewDetailparent' data-toggle='modal' data-target='#ParentViewModal' href='#'><i class='fa fa-search fa-fw'></i>View Details</a><input type='hidden' value='" + $(this).find("ParentWorktypeID").text() + "'/><input id='parent' type='hidden' value='" + $(this).find("ParentWorktypeName").text() + "'/><input id='active' type='hidden' value='" + $(this).find("IsActive").text() + "'/><input id='createdby' type='hidden' value='" + $(this).find("CreatedBy").text() + "'/><input id='createddate' type='hidden' value='" + $(this).find("CreatedDate").text() + "'/>");
                        $("[id*=gridparent]").append(row);

                        row = $("[id*=gridparent] tr:last-child").clone(true);

                    });

                    $('.editparent').click(function (event) {
                        $('#txteditparentid').val($(this).next().val());
                        $('#txteditparent').val($(this).next().next().val());

                    })

                    $('.viewDetailparent').click(function (event) {
                        var date = new Date();
                        $('#lblparent').text($(this).next().next().val());
                        $('#lblactive').text($(this).next().next().next().val());
                        $('#lblcreated').text($(this).next().next().next().next().val());
                        //$('#lblcdate').text($(this).next().next().next().next().next().val());

                        date = new Date($(this).next().next().next().next().next().val());
                        $('#lblcdate').html(date.toLocaleString());
                    })
                   
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
   //display worktype gridview
        function displayworktype() {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/displayWorktype",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {

                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var Dparents = xml.find("Table1");
                    var row = $("[id*=gridworktype] tr:last-child").clone(true);
                    $("[id*=gridworktype] tr").not($("[id*=gridworktype] tr:first-child")).remove();
                    $.each(Dparents, function () {
                        var Dparents = $(this);

                        $("td", row).eq(0).html("<input id='teamworktypeid' type='hidden' value='" + $(this).find("TeamWorktypeID").text() + "' /><input id='parentworktypeid' type='hidden' value='" + $(this).find("TeamParentWorktypeID").text() + "' />" + $(this).find("ParentWorktypeName").text());
                        $("td", row).eq(1).html("<input id='worktypeid' type='hidden' value='" + $(this).find("WorktypeID").text() + "' />" + $(this).find("WorktypeName").text());

                        x = new String($(this).find("IsActive").text());

                        if (x == 'true') {
                            $("td", row).eq(2).html(('Active'));
                        }
                        else {
                            $("td", row).eq(2).html(('InActive'));
                        }
                        y = new String($(this).find("IsTransactionVolume").text());

                        if (y == 'true') {
                            $("td", row).eq(3).html(('Active'));
                        }
                        else if (y == '') {
                            $("td", row).eq(3).html((''));
                        }
                        else {
                            $("td", row).eq(3).html(('InActive'));
                        }
                        $("[id*=gridworktype]").append(row);
                        $("td", row).eq(4).html("<input id='volume' class='volume' class='parentWT' type='hidden' value='" + $(this).find("IsTransactionVolume").text() + "' /><input id='active' class='active' class='parentWT' type='hidden' value='" + $(this).find("IsActive").text() + "' /><input id='parentid' class='parentid' class='parentWT' type='hidden' value='" + $(this).find("ParentWorktypeID").text() + "' /><input id='parentWT' class='parentWT' type='hidden' value='" + $(this).find("ParentWorktypeName").text() + "' /><input id='worktypename' type='hidden' value='" + $(this).find("WorktypeName").text() + "' /><input id='teamworktypeid' type='hidden' value='" + $(this).find("TeamWorktypeID").text() + "' /><a id='edit' class='editWT' data-toggle='modal' data-target='#myModalWT' href='#'><i class='fa fa-edit fa-fw'></i>Edit Worktype</a></br><a id='editspt' href='#' data-toggle='modal' data-target='#myModal' class='editspt'><i class='fa fa-edit fa-fw'></i>Edit SPT</a><input type='hidden' value='" + $(this).find("TeamWorktypeID").text() + "'/><br/ > <a id='viewDetail' data-toggle='modal' data-target='#worktypeModal' class='viewDetail' href='#'><i class='fa fa-search fa-fw'></i>View Details</a><input id='parentworktypename' type='hidden' value='" + $(this).find("ParentWorktypeName").text() + "' /><input id='worktypename' type='hidden' value='" + $(this).find("WorktypeName").text() + "' /><input id='createdby' type='hidden' value='" + $(this).find("CreatedBy").text() + "' /><input id='createddate' type='hidden' value='" + $(this).find("CreatedDate").text() + "' /><input id='active' type='hidden' value='" + $(this).find("IsActive").text() + "' /><input id='volume' type='hidden' value='" + $(this).find("IsTransactionVolume").text() + "' />");
                        //<a id='editspt' class='viewDetail' href='#'><i class='fa fa-search fa-fw'></i>Edit Spt</a>
                        $("[id*=gridworktype]").append(row);

                        row = $("[id*=gridworktype] tr:last-child").clone(true);


                    });
                    $('.editspt').click(function (event) {
                        //alert($(this).parent().parent().find('td:first-child').text());
                        displayspt($(this).next().val());
                    })
                    $('.editWT').click(function (event) {
                        $('#txteditWTid').val($(this).prev().val());
                        $('#txteditWT').val($(this).prev().prev().val());
                        $('#ddlparent').val($(this).prev().prev().prev().prev().val());
                        //$('#txteditWT').val($(this).prev().prev().prev().prev().prev().val());
                       var x = new String($(this).prev().prev().prev().prev().prev().val());
                        if (x == 'true') {
                           $('#ddlactive').val('1');
                        } else if (x == 'false') {
                            $('#ddlactive').val('0');
                        } else {
                            $('#ddlactive').val('0');
                        }
                       var y = new String($(this).prev().prev().prev().prev().prev().prev().val());
                        if (y == 'true') {
                            $('#ddltransaction').val('1');
                        } else if (y == 'false') {
                            $('#ddltransaction').val('0');
                        } else {
                            $('#ddltransaction').val('2');
                        }
                    })
                    $('.viewDetail').click(function (event) {
                        var date = new Date();
                        $('#lblpworktype').text($(this).next().val());
                        $('#lblworktype').text($(this).next().next().val());
                        var z = new String($(this).next().next().next().next().next().next().val());
                        if (z == 'true') {
                            $('#lblvolume').text("True");
                        } else if (z == 'false') {
                            $('#lblvolume').text("False");
                        } else {
                            $('#lblvolume').text("Not Set");
                        }
                        date = new Date($(this).next().next().next().next().val()); 
                        $('#lblwtcdate').html(date.toLocaleString());
                        $('#lblwtcreated').text($(this).next().next().next().val());
                        $('#lblwtactive').text($(this).next().next().next().next().next().val());
                        //$('#lblvolume').text($(this).next().next().next().next().next().next().val());

                    })

                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
   //display spt modal gridview 
        function displayspt(id, parent, wtype) {
            //$('#spttitle').text();
            // alert('SPT: ' + parent + ' - ' + wtype);
            var arr = new Array();
            arr[0] = id;
            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/displayspt",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    //$("#ddlParent option").remove();

                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var Dparents = xml.find("Table1");
                    var row = $("[id*=gridupdatespt] tr:last-child").clone(true);
                    $("[id*=gridupdatespt] tr").not($("[id*=gridupdatespt] tr:first-child")).remove();
                    $.each(Dparents, function () {
                        var Dparents = $(this);

                        $("td", row).eq(0).html("<input id='parentworktypeid' type='hidden' value='" + $(this).find("TeamParentWorktypeID").text() + "' />" + $(this).find("ParentWorktypeName").text());
                        $("td", row).eq(1).html("<input id='worktypeid' type='hidden' value='" + $(this).find("WorktypeID").text() + "' />" + $(this).find("WorktypeName").text());
                        $("td", row).eq(2).html($(this).find("SptTU").text());
                        $("td", row).eq(3).html($(this).find("SptBU").text());
                        $("td", row).eq(4).html("<a id='editspt' class='editspt' href='#' value='" + $(this).find("TeamParentWorktypeID").text() + "'><i class='fa fa-edit fa-fw'></i>Edit</a></br><a id='editspt' class='editDetail' href='#'><i class='fa fa-search fa-fw'></i>Edit Spt</a>");
                        $("[id*=gridupdatespt]").append(row);

                        row = $("[id*=gridupdatespt] tr:last-child").clone(true);
                    });


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
   //DISPLAY PARENT DROPDOWN MODAL
        function displayparentMOdal() {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/displayParentmodal",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {

                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var parents = xml.find("Table1");
                    $.each(parents, function () {
                        var parents = $(this);
                        var o = new Option($(this).find("ParentWorktypeName").text(), $(this).find("ParentWorktypeID").text())
                        $(o).html($(this).find("ParentWorktypeName").text());
                        $('#ddlparent').append(o);


                    });


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
        //display npt gridview
        function displayNPT() {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "EveSettings.aspx/displayNpt",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var npt = xml.find("Table1");
                    var row = $("[id*=gridnpt] tr:last-child").clone(true);
                    $("[id*=gridnpt] tr").not($("[id*=gridnpt] tr:first-child")).remove();
                    $.each(npt, function () {
                        var npt = $(this);

                        $("td", row).eq(0).html("<input id='taskid' type='hidden' value='" + $(this).find("TaskID").text() + "' />" + $(this).find("TaskName").text());
                        $("td", row).eq(1).html($(this).find("IsActive").text());
                        $("td", row).eq(2).html("<a id='editnpt' class='editnpt'class='edit'data-toggle='modal' data-target='#myModalNpt' href='#'><i class='fa fa-edit fa-fw'></i>Edit</a><input id='taskid' type='hidden' value='" + $(this).find("TaskID").text() + "' /><input id='taskname' type='hidden' value='" + $(this).find("TaskName").text() + "' /></br><a id='nptviewDetail' data-toggle='modal' data-target='#NPTModal' class='nptviewDetail' href='#'><i class='fa fa-search fa-fw'></i>View Details</a><input id='taskname' type='hidden' value='" + $(this).find("TaskName").text() + "' /><input id='active' type='hidden' value='" + $(this).find("IsActive").text() + "' /><input id='createdby' type='hidden' value='" + $(this).find("CreatedBy").text() + "' /><input id='createddate' type='hidden' value='" + $(this).find("CreateDate").text() + "' />");
                        $("[id*=gridnpt]").append(row);

                        row = $("[id*=gridnpt] tr:last-child").clone(true);
                    });

                    $('.editnpt').click(function (event) {
                        $('#txteditnptid').val($(this).next().val());
                        $('#txteditnpt').val($(this).next().next().val());
                    })

                    $('.nptviewDetail').click(function (event) {
                        var date = new Date();
                        $('#lblnpt').text($(this).next().val());
                        $('#lblnptactive').text($(this).next().next().val());
                        $('#lblnptcreated').text($(this).next().next().next().val());
                        //$('#lblnptcreateddate').text($(this).next().next().next().next().val());

                        date = new Date($(this).next().next().next().next().val());
                        $('#lblnptcreateddate').html(date.toLocaleString());
                    })
                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

    </script>
</asp:Content>
