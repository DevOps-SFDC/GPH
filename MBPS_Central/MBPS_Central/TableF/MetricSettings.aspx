<%@ Page Title="Table F Metric Settings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MetricSettings.aspx.cs" Inherits="MBPS_Central.TableF.MetricSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        a {
            color: #333;
        }

        dt, dd {
            line-height: 1.8;
        }

        dt {
            text-decoration: underline;
        }

        .dropdown a {
            color: #fff;
        }

        #keytitle {
            font-size: 17px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-sliders fa-fw"></i>Table F Metrics Settings</h1>
                <div class="panel-heading">
                    Manage your team's Table F Metrics
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
                        <div class="col-md-6 alert alert-success">
                            <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Dropdown list of your Teams</p>
                        </div>
                        <%--<div class="col-md-6">
                            
                        </div>--%>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="exzbit">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-mgreen">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-group fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit1" class="huge">Exhibit 1</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="kcrp">Key Customer Related Processes</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex1">
                        <div class="panel-footer">
                            <span class="pull-left">Display Keys</span><input id="ex1h" type="hidden" value="1" />
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-mbrown">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-cubes fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit2" class="huge">Exhibit 2</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="ksp">Key Support Processes</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex2">
                        <div class="panel-footer">
                            <span class="pull-left">Display Keys</span><input id="ex2h" type="hidden" value="2" />
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-jhgray">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-paper-plane fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit3" class="huge">Exhibit 3</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="kom">Key Outcome Metrics</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex3">
                        <div class="panel-footer">
                            <span class="pull-left">Display Keys</span><input id="ex3h" type="hidden" value="3" />
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-jhblue">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-suitcase fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit4" class="huge">Exhibit 4</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="crm">Client Required Metrics</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex4">
                        <div class="panel-footer">
                            <span class="pull-left">Display Keys</span><input id="ex4h" type="hidden" value="4" />
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="row" id="akeys" style="display: none">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong><span id="keytitle"></span></strong>
                        <div class="command-panel pull-right"><a id="returnx" href="#"><i class="fa fa-rotate-left fa-fw"></i>Return to Exhibits</a></div>
                        <div class="clearfix"></div>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView
                                ID="gridKeys"
                                runat="server"
                                CssClass="table table-striped table-bordered"
                                AutoGenerateColumns="false"
                                ClientIDMode="Static">
                                <Columns>
                                    <asp:BoundField DataField="KeyName" HeaderText="Key Name" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div id="metrictable" class="table-responsive">
                            <div class="command-panel pull-right"><a id="returnkeys" href="#"><i class="fa fa-rotate-left fa-fw"></i>Return to Keys</a></div>
                            <div class="command-panel pull-right"><a id="displayKeys" class='displayKeys mbpshidden' data-toggle='modal' data-target='#modKeys' href="#"><i class="fa fa-plus-square-o fa-fw"></i>New Keys</a></div>
                            <div class="clearfix"></div>
                            <asp:GridView
                                ID="gridMetrics"
                                runat="server"
                                CssClass="table table-striped table-bordered"
                                AutoGenerateColumns="false"
                                ClientIDMode="Static">
                                <Columns>
                                    <asp:BoundField DataField="Metrics" HeaderText="Metrics" />
                                    <asp:BoundField DataField="MetricsDesc" HeaderText="Description" />
                                    <asp:BoundField DataField="ItemName" HeaderText="Item" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="modal fade" id="modTarget" tabindex="-1" role="dialog" aria-labelledby="modTargetLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="modTargetLabel"><span id="targettitle"></span></h4>
                                    </div>
                                    <div class="modal-body">
                                        <dl>
                                            <dt>Target Direction</dt>
                                            <dd>
                                                <asp:DropDownList
                                                    ID="ddltargetdirectionV"
                                                    runat="server"
                                                    ClientIDMode="Static"
                                                    CssClass="form-control">
                                                    <asp:ListItem Text="Select Direction.." Value=""></asp:ListItem>
                                                    <asp:ListItem Text="(>=) Greater Than or Equal" Value=">="></asp:ListItem>
                                                    <asp:ListItem Text="(>) Greater than" Value=">"></asp:ListItem>
                                                    <asp:ListItem Text="(<=) Less Than or Equal" Value="<="></asp:ListItem>
                                                    <asp:ListItem Text="(<) Less Than" Value="<"></asp:ListItem>
                                                    <asp:ListItem Text="(N/A) Not Applicable" Value="N/A"></asp:ListItem>
                                                </asp:DropDownList>
                                            </dd>
                                            <dt>Target Value</dt>
                                            <dd>
                                                <input id="targetvalueV" class="form-control" />
                                            </dd>
                                            <dt>Target Description</dt>
                                            <dd>
                                                <textarea id="targetdescV" rows="3" class="form-control"></textarea>
                                            </dd>
                                            <dt>Data Source</dt>
                                            <dd>
                                                <asp:DropDownList
                                                    ID="ddltargetsourceV"
                                                    runat="server"
                                                    ClientIDMode="Static"
                                                    CssClass="form-control"
                                                    multiple="">
                                                    <%--<asp:ListItem Text="Not Applicable" Value="NA"></asp:ListItem>--%>
                                                    <asp:ListItem Text="Manual Entry" Value="Manual"></asp:ListItem>
                                                    <asp:ListItem Text="Manual PT" Value="MPT"></asp:ListItem>
                                                    <asp:ListItem Text="OPT (Operations Perfomance Tracker)" Value="OPT"></asp:ListItem>
                                                    <asp:ListItem Text="ATO (Agile Tracker Online)" Value="ATO"></asp:ListItem>
                                                    <asp:ListItem Text="Raw Data Extract (e.g. AVAYA IQ, AWD)" Value="Raw"></asp:ListItem>
                                                    <%--<asp:ListItem Text="Others" Value="Others"></asp:ListItem>--%>
                                                </asp:DropDownList>
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default">Edit</button>
                                        <button type="button" class="btn btn-succes" data-dismiss="modal">Ok</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="modKeys" tabindex="-1" role="dialog" aria-labelledby="modKeysLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="modKeysLabel">New Key for <span id="keystitle"></span></h4>
                                        <asp:HiddenField ID="hfKeyID" runat="server" ClientIDMode="Static" />
                                    </div>
                                    <div class="modal-body">
                                        <dl>
                                            <dt>Metric Name</dt>
                                            <dd>
                                                <input id="metricname" class="form-control" />
                                            </dd>
                                            <dt>Metric Description</dt>
                                            <dd>
                                                <textarea id="metricdescription" rows="3" class="form-control"></textarea>
                                            </dd>
                                            <dt>Item</dt>
                                            <dd>
                                                <asp:DropDownList
                                                    ID="ddlmetricitem"
                                                    runat="server"
                                                    ClientIDMode="Static"
                                                    CssClass="form-control">
                                                </asp:DropDownList>
                                            </dd>
                                            <dt>Calculations (How it is measured)</dt>
                                            <dd>
                                                <textarea id="metriccalculations" rows="3" class="form-control"></textarea>
                                            </dd>
                                            <dt>Considerations (Special Additions or Excemptions)</dt>
                                            <dd>
                                                <textarea id="metricconsiderations" rows="3" class="form-control"></textarea>
                                            </dd>
                                            <dt>Best Practice (Benchmark or Best Targets)</dt>
                                            <dd>
                                                <input id="metricbestpractice" class="form-control" />
                                            </dd>
                                            <dt>Frequency</dt>
                                            <dd>
                                                <input id="metricfrequency" class="form-control" />
                                            </dd>
                                        </dl>
                                    </div>
                                    <div class="modal-footer">
                                        <button id="savemetric" type="button" class="btn btn-succes">Save</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel"><span id="metrictitle"></span></h4>
                                    </div>
                                    <div class="modal-body">
                                        <dl>
                                            <dt>Metric Description</dt>
                                            <dd id="metdesc"></dd>
                                            <dt>Item <span id="itemno"></span></dt>
                                            <dd id="metitem"></dd>
                                            <dt>Calculations (How it is measured)</dt>
                                            <dd id="metcalc"></dd>
                                            <dt>Considerations (Special Additions or Excemptions)</dt>
                                            <dd id="metcons"></dd>
                                            <dt>Best Practice (Benchmark or Best Targets)</dt>
                                            <dd id="metbest"></dd>
                                            <dt>Frequency</dt>
                                            <dd id="metfreq"></dd>
                                        </dl>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a id="metricsettinganchor"></a>
                        <div id="metricsettings" class="panel panel-default mbpshidden">
                            <div class="panel-heading">
                                <strong><span id="metrictitletarget"></span></strong>
                                <input id="metricid" type="hidden" />
                            </div>
                            <div class="panel-body">
                                <%--<div class="form-group">
                                    <label>Team Selection</label>
                                    <div class="clearfix"></div>
                                    <div class="col-md-6">
                                        <asp:DropDownList
                                            ID="ddlTeams"
                                            runat="server"
                                            CssClass="form-control"
                                            ClientIDMode="Static">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="alert alert-success">
                                            <p class="help-block">
                                                <i class="fa fa-info-circle fa-fw"></i>Selection of team on which this COPC will be applied.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Team Metric Name</label>
                                    <div class="clearfix"></div>
                                    <div class="col-md-6">
                                        <input id="teammetricname" class="form-control" />
                                    </div>
                                    <div class="col-md-6">
                                        <div class="alert alert-success">
                                            <p class="help-block">
                                                <i class="fa fa-info-circle fa-fw"></i>Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.
                                            </p>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <label>Target Direction</label>
                                    <div class="clearfix"></div>
                                    <div class="col-md-6">
                                        <asp:DropDownList
                                            ID="ddltargetdirection"
                                            runat="server"
                                            ClientIDMode="Static"
                                            CssClass="form-control">
                                            <asp:ListItem Text="Select Direction.." Value=""></asp:ListItem>
                                            <asp:ListItem Text="(>=) Greater Than or Equal" Value=">="></asp:ListItem>
                                            <asp:ListItem Text="(>) Greater than" Value=">"></asp:ListItem>
                                            <asp:ListItem Text="(<=) Less Than or Equal" Value="<="></asp:ListItem>
                                            <asp:ListItem Text="(<) Less Than" Value="<"></asp:ListItem>
                                            <asp:ListItem Text="(N/A) Not Applicable" Value="N/A"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="alert alert-success">
                                            <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Direction of your target versus the acquired volume.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <label>Target Value</label>
                                    <div class="clearfix"></div>
                                    <div class="col-md-6">
                                        <input id="targetvalue" class="form-control">
                                    </div>
                                    <div class="col-md-6">
                                        <div class="alert alert-success">
                                            <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Target value to achieve.</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <div class="form-group">
                                    <label>Target Description</label>
                                    <div class="clearfix"></div>
                                    <div class="col-md-6">
                                        <textarea id="targetdesc" rows="3" class="form-control"></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="alert alert-success">
                                            <p class="help-block">
                                                <i class="fa fa-info-circle fa-fw"></i>Description of the target. (e.g. how to achieve)
                                            <br />
                                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
                                            Vestibulum tincidunt est vitae ultrices accumsan. Aliquam ornare lacus adipiscing, posuere lectus et, fringilla augue.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <%--<div class="form-group">
                                    <label>PST Metric</label>
                                    <div class="clearfix"></div>
                                    <div class="col-md-6">
                                        <input id="targetpst" class="form-control" />
                                    </div>
                                    <div class="col-md-6">
                                        <div class="alert alert-success">
                                            <p class="help-block">
                                                <i class="fa fa-info-circle fa-fw"></i>Performance Summary Table (PST)<br />
                                                A table summarizing the performance of key output metrics, use to calculate the number of metrics consistenly 
                                            meeting target and/or showing sustained improvement.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>--%>
                                <div class="form-group">
                                    <label>Datasource</label>
                                    <div class="clearfix"></div>
                                    <div class="col-md-6">
                                        <asp:DropDownList
                                            ID="ddltargetsource"
                                            runat="server"
                                            ClientIDMode="Static"
                                            CssClass="form-control"
                                            multiple="">
                                            <%--<asp:ListItem Text="Not Applicable" Value="NA" Selected="True"></asp:ListItem>--%>
                                            <asp:ListItem Text="Manual Entry" Value="Manual" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="Manual PT" Value="MPT"></asp:ListItem>
                                            <asp:ListItem Text="OPT (Operations Perfomance Tracker)" Value="OPT"></asp:ListItem>
                                            <asp:ListItem Text="ATO (Agile Tracker Online)" Value="ATO"></asp:ListItem>
                                            <asp:ListItem Text="Raw Data Extract (e.g. AVAYA IQ, AWD)" Value="Raw"></asp:ListItem>
                                            <%--<asp:ListItem Text="Others" Value="Others"></asp:ListItem>--%>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="alert alert-success">
                                            <p class="help-block">
                                                <i class="fa fa-info-circle fa-fw"></i>Datasources for this Metric. Select multiple by highlighting the items
                                            <br />
                                                (Shift & Hold Click then drag) or (Control & Click the items)
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>

                                <div class="pull-right">
                                    <button id="canceltarget" type="button" class="btn btn-success"><i class="fa fa-times fa-fw"></i>Cancel</button>
                                    <button id="newtarget" type="button" class="btn btn-success"><i class="fa fa-floppy-o fa-fw"></i>Save</button>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            var x = 0;

            $('#ddlTeams').change(function () {
                clearForm();
                $('#metrictable').hide();
                $('#keytitle').text('');
                $('#gridKeys').children().children().fadeIn();
                $('#akeys').slideUp();
                $('#exzbit').slideDown();
                $('#metricsettings').slideUp();
                $('#gridMetrics').children().children().fadeIn();
            })

            $('#metrictable').hide();

            $('#ex1').click(function () {
                fudger($('#ex1h').val())
                $('#keytitle').text($('#kcrp').text() + ' (' + $('#exhibit1').text() + ')');
                $('#exzbit').slideUp();
                $('#akeys').slideDown();
                $('.displayKeys').hide();
            })

            $('#ex2').click(function () {
                fudger($('#ex2h').val())
                $('#keytitle').text($('#ksp').text() + ' (' + $('#exhibit2').text() + ')');
                $('#exzbit').slideUp();
                $('#akeys').slideDown();
                $('.displayKeys').hide();
            })

            $('#ex3').click(function () {
                fudger($('#ex3h').val())
                $('#keytitle').text($('#kom').text() + ' (' + $('#exhibit3').text() + ')');
                $('#exzbit').slideUp();
                $('#akeys').slideDown();
                $('.displayKeys').hide();
            })

            $('#ex4').click(function () {
                fudger($('#ex4h').val())
                $('#keytitle').text($('#crm').text() + ' (' + $('#exhibit4').text() + ')');
                $('#exzbit').slideUp();
                $('#akeys').slideDown();
                $('.displayKeys').show();
            })

            $('#returnx').click(function () {
                clearForm();
                $('#metrictable').hide();
                $('#keytitle').text('');
                $('#gridKeys').children().children().fadeIn();
                $('#akeys').slideUp();
                $('#exzbit').slideDown();
                $('#metricsettings').slideUp();
                $('#gridMetrics').children().children().fadeIn();
            })

            $('#returnkeys').click(function () {
                clearForm();
                $('#metrictable').slideUp();
                $('#gridKeys').children().children().fadeIn();
                $('#metricsettings').slideUp();
                $('#gridMetrics').children().children().fadeIn();
            })

            $('#canceltarget').click(function () {
                $('#metricsettings').slideUp();
                $('#gridMetrics').children().children().fadeIn();
                $('html, body').animate({ scrollTop: $("#wrapper").offset().top }, 1000);
            })

            //$(window).bind('beforeunload', function () {
            //    return 'X?';
            //});

            $('#newtarget').click(function () {
                insertNewTFTeamMetr();
            })

            $('#savemetric').click(function () {
                if ($('#metricname').val() == '') {
                    alert('Please input Metric Name...');
                    $('#metricname').focus();
                }
                else if ($('#ddlmetricitem').val() == 0) {
                    alert('Please select an Item...');
                    $('#ddlmetricitem').focus();
                }
                else if ($('#metriccalculations').val() == '') {
                    alert('Please input Metric Calculations...');
                    $('#metriccalculations').focus();
                }
                else {
                    insertMetric();
                    //$('#modKeys').hide();
                    $('#displayKeys').trigger('click');
                }
            })

            $('.displayKeys').click(function () {
                clearKeys();
                //$('#modKeys').show();
            })
        })

        function clearKeys() {
            $('#metricname').val('');
            $('#metricdescription').val('');
            $('#ddlmetricitem')[0].selectedIndex = 0;
            $('#metriccalculations').val('');
            $('#metricconsiderations').val('');
            $('#metricbestpractice').val('');
            $('#metricfrequency').val('');
        }

        function clearForm() {
            //if ($('#ddltargetdirection')[0].selectedIndex > 0) {
            //    alert('Are you sure?');
            //}
            $('#ddltargetdirection')[0].selectedIndex = 0;
            $('#targetvalue').val('');
            $('#targetdesc').val('');
            $('#ddltargetsource')[0].selectedIndex = 0;

            $('#ddltargetdirectionV')[0].selectedIndex = 0;
            $('#targetvalueV').val('');
            $('#targetdescV').val('');
            $('#ddltargetsourceV')[0].selectedIndex = -1;
        }

        function replay() {
            $('.displayDetails').click(function () {
                //alert($(this).next().val());
                metricspecific($(this).next().val());
            })

            $('.selectmetric').click(function () {
                $('#metricid').val($(this).prev().val());
                $('#metrictitletarget').text($(this).parent().parent().children().first().text());
                var x = $(this).parent().parent().index();
                for (var i = 0; i < 2; i++) {
                    if (i == 0) {
                        $('#gridMetrics').children().children().each(function () {
                            if ($(this).index() != 0 && $(this).index() != x) {
                                $(this).fadeOut('slow');
                            }
                        });

                    }
                    if (i == 1) {
                        $('#metricsettings').slideDown();
                    }
                }
                $.scrollTo($('#metrictitletarget'), 1000);
            })

            $('.viewTarget').click(function () {
                //alert($(this).prev().val());
                clearForm();
                displaytarget($(this).prev().val());
            })
        }

        function displaytarget(metricid) {
            $.ajax({
                type: "POST",
                url: "MetricSettings.aspx/TargetDisplay",
                data: '{ metricid: ' + metricid + ', teamid: ' + $('#ddlTeams').val() + ' }',
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
                    $('#targettitle').text($(this).find("Metrics").text());
                    $('#ddltargetdirectionV').val($(this).find("TargetDirection").text());
                    $('#targetvalueV').val($(this).find("Target").text());
                    $('#targetdescV').val($(this).find("TargetDescription").text());
                    //$('#ddltargetsourceV').val('Not Applicable');
                    var sourcevalue = $(this).find("Source").text();
                    //alert(sourcevalue);
                    var selectedsource = sourcevalue.split(",");
                    for (var i in selectedsource) {
                        var selectedoption = selectedsource[i];
                        $('#ddltargetsourceV').find("option[value=" + selectedoption + "]").prop("selected", "selected");
                    }
                    $("select").multiselect('refresh');
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function metricspecific(metricid) {
            $.ajax({
                type: "POST",
                url: "MetricSettings.aspx/MetricSpecificDisplay",
                data: '{metricid: ' + metricid + '}',
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
                    $('#metrictitle').text($(this).find("Metrics").text())
                    $('#metdesc').text($(this).find("MetricsDesc").text())
                    $('#itemno').text($(this).find("Item").text())
                    $('#metitem').text($(this).find("ItemName").text())
                    $('#metcalc').text($(this).find("Calculations").text())
                    $('#metcons').text($(this).find("Considerations").text())
                    $('#metbest').text($(this).find("BestPractice").text())
                    $('#metfreq').text($(this).find("Frequency").text())
                });
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function metricfudger(keyid) {
            $.ajax({
                type: "POST",
                url: "MetricSettings.aspx/MetricDisplay",
                data: '{ keyid: ' + keyid + ', teamid: ' + $('#ddlTeams').val() + ' }',
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
                var row = $("[id*=gridMetrics] tr:last-child").clone(true);
                $("[id*=gridMetrics] tr").not($("[id*=gridMetrics] tr:first-child")).remove();
                $.each(exkeys, function () {
                    var exkeys = $(this);
                    $("td", row).eq(0).html($(this).find("Metrics").text());
                    $("[id*=gridMetrics]").append(row);
                    $("td", row).eq(1).html($(this).find("MetricsDesc").text());
                    $("[id*=gridMetrics]").append(row);
                    $("td", row).eq(2).html($(this).find("ItemName").text());
                    $("[id*=gridMetrics]").append(row);
                    if (!$(this).find("TeamID").text()) {
                        $("td", row).eq(3).html("<a class='displayDetails' data-toggle='modal' data-target='#myModal' href='#'><i class='fa fa-info-circle fa-fw'></i>More Details</a> <input type='hidden' value='" + $(this).find("MetricsID").text() + "'/> <a class='selectmetric' href='#'><i class='fa fa-plus-square fa-fw'></i>Select</a>");
                    }
                    else {
                        $("td", row).eq(3).html("<a class='displayDetails' data-toggle='modal' data-target='#myModal' href='#'><i class='fa fa-info-circle fa-fw'></i>More Details</a> <input type='hidden' value='" + $(this).find("MetricsID").text() + "'/> <a class='viewTarget' data-toggle='modal' data-target='#modTarget' href='#'><i class='fa fa-bullseye fa-fw'></i>View Target</a>");
                    }

                    $("[id*=gridMetrics]").append(row);
                    row = $("[id*=gridMetrics] tr:last-child").clone(true);
                });

                replay();

                $('#metrictable').slideDown();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
                $("[id*=gridMetrics] tr").not($("[id*=gridMetrics] tr:first-child")).remove();
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function fudger(exhibitid) {
            $.ajax({
                type: "POST",
                url: "MetricSettings.aspx/test1",
                data: '{exid: ' + exhibitid + '}',
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
                var row = $("[id*=gridKeys] tr:last-child").clone(true);
                $("[id*=gridKeys] tr").not($("[id*=gridKeys] tr:first-child")).remove();
                $.each(exkeys, function () {
                    var exkeys = $(this);
                    $("td", row).eq(0).html($(this).find("KeyName").text());
                    $("[id*=gridKeys]").append(row);
                    $("td", row).eq(1).html("<a class='displayMetrics' href='#'><i class='fa fa-edit fa-fw'></i>Select Metrics</a> <input type='hidden' value='" + $(this).find("KeyID").text() + "'/>");
                    $("[id*=gridKeys]").append(row);
                    row = $("[id*=gridKeys] tr:last-child").clone(true);
                });

                $('.displayMetrics').click(function (event) {
                    $('#hfKeyID').val($(this).next().val());
                    metricfudger($(this).next().val());
                    var x = $(this).parent().parent().index();
                    for (var i = 0; i < 2; i++) {
                        if (i == 0) {
                            $('#gridKeys').children().children().each(function () {
                                if ($(this).index() != 0 && $(this).index() != x) {
                                    $(this).fadeOut('slow');
                                }
                            });
                        }
                    }
                })
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
                $("[id*=gridKeys] tr").not($("[id*=gridKeys] tr:first-child")).remove();
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function insertMetric() {
            var arr = new Array();
            arr[0] = $('#hfKeyID').val();
            arr[1] = $('#ddlmetricitem').val();
            arr[2] = $('#metricname').val();
            arr[3] = $('#metricdescription').val();
            arr[4] = $('#metriccalculations').val();
            arr[5] = $('#metricconsiderations').val();
            arr[6] = $('#metricbestpractice').val();
            arr[7] = $('#metricfrequency').val();
            arr[8] = $('#ddlTeams').val();
            arr[9] = '<%: Session["WDID"] %>';
            $.ajax({
                type: "POST",
                url: "MetricSettings.aspx/saveMetric",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                alert(response.d);
                $('#metrictable').slideUp();
                $('#gridKeys').children().children().fadeIn();
                $('#metricsettings').slideUp();
                $('#gridMetrics').children().children().fadeIn();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function insertNewTFTeamMetr() {
            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            arr[1] = $('#metricid').val();
            arr[2] = $('#ddltargetdirection').val();
            arr[3] = $('#targetvalue').val();
            arr[4] = $('#targetdesc').val();
            arr[5] = '<%: Session["WDID"] %>';
            arr[6] = $('#ddltargetsource').val().toString();
            $.ajax({
                type: "POST",
                url: "MetricSettings.aspx/saveTableFTeamMetric",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                alert(response.d);
                clearForm();
                $('#metrictable').slideUp();
                $('#gridKeys').children().children().fadeIn();
                $('#metricsettings').slideUp();
                $('#gridMetrics').children().children().fadeIn();
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
