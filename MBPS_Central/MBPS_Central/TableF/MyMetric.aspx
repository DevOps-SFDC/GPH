<%@ Page Title="My Metrics" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyMetric.aspx.cs" Inherits="MBPS_Central.TableF.MyMetric" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        a {
            color: #333;
        }

        dt, dd {
            line-height: 2;
            
        }

        dt {
            text-decoration: underline;
            font-size:large;
        }

        dd {
            margin-bottom:1em;
        }

        .dropdown a {
            color: #fff;
        }

        #keytitle {
            font-size: 17px;
        }

        .mbps > li > a:hover {
            background: #D1C99E;
            cursor: default;
            color: #333;
        }

        #dataInput {
            width:100% !important;
            margin-bottom:5px;
        }

        #learnMore {
            text-decoration:underline;
        }
    </style>

    <script src="../Scripts/Converter/Controller.js"></script>
    <script src="../Scripts/Converter/converter.js"></script>
    <script src="../Scripts/Converter/CSVParser.js"></script>
    <script src="../Scripts/Converter/DataGridRenderer.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-sliders fa-fw"></i>Table F My Metrics</h1>
                <div class="panel-heading">
                    Manage your team's Table F Metrics' Ratings
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
                        <%--<div class="col-md-6 alert alert-success">
                            <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Dropdown list of your Teams</p>
                        </div>
                        <div class="clearfix"></div>--%>
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
                        <%--<div class="col-md-6 alert alert-success">
                            <p class="help-block"><i class="fa fa-info-circle fa-fw"></i>Dropdown list of Month and Year</p>
                        </div>--%>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" id="akeys">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs mbps">
                            <li class="active"><a data-toggle="tab" id="step-0">Start Reports Processing</a></li>
                            <li><a id="step-1">Step 1 (ATO 2.0)</a>
                            </li>
                            <%--<li><a id="step-2">Step 2 (PT Excel)</a>
                            </li>--%>
                            <li><a id="step-3">Step 2 (Manual Input)</a>
                            </li>
                            <li><a id="step-4">Step 3 (Summary)</a>
                            </li>
                            <li><a id="step-5">Step 4 (Commit and Save)</a>
                            </li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane fade in active" id="start-pills">
                                <div id="start-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Start</h4>
                                    </div>
                                    <div class="panel-body">
                                        <p>This is the starting process for Table F Metric Processing. Put any short instructions or guidelines here on how the process works.</p>
                                        <div class="pull-right">
                                            <select id="ddlteammetrics" class="mbpshidden"></select>
                                            <button id="start-wiz" type="button" class="btn btn-success"><i class="fa fa-play fa-fw"></i>Start</button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- ATO -->
                            <div class="tab-pane fade in" id="ato-pills">
                                <div id="ato-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>ATO 2.0</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div id="atotable" class="table-responsive">
                                            <asp:GridView
                                                ID="gridATO"
                                                runat="server"
                                                CssClass="table table-striped table-bordered"
                                                AutoGenerateColumns="false"
                                                ClientIDMode="Static">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="ATO Metrics"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ratings"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Team Metrics"></asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <hr />
                                            <div class="pull-right">
                                                <button id="step1-next" type="button" class="btn btn-success"><i class="fa fa-forward fa-fw"></i>Next</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- PT -->
                            <%--<div class="tab-pane fade" id="pt-pills">
                                <div id="pt-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>PT - Excel</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <div id='settings'></div>
                                            <div id='converter' class=''></div>
                                            <div id="ptcommand" class="pull-right">
                                                <button id="xmlconvrt" type="button" class="btn btn-success"><i class="fa fa-refresh fa-fw"></i>Convert</button>
                                                or
                                                <button id="ptupload" type="button" class="btn btn-success"><i class="fa fa-upload fa-fw"></i>Upload PT</button>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div id="pttable" class="table-responsive" style="display: none;">
                                            <asp:GridView
                                                ID="gridPT"
                                                runat="server"
                                                CssClass="table table-striped table-bordered"
                                                AutoGenerateColumns="false"
                                                ClientIDMode="Static">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="PT Metrics"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ratings"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Team Metrics"></asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                        <hr />
                                        <div class="pull-right">
                                            <button id="step2-next" type="button" class="btn btn-success"><i class="fa fa-forward fa-fw"></i>Next</button>
                                        </div>

                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        <h4 class="modal-title" id="myModalLabel"><span id="modaltitle">Instructions in PT - Excel</span></h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <dl>
                                                            <dt>1st Step - Select Summary Tab from your Monthly PT Excel</dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s1.JPG" />
                                                                <hr />
                                                            </dd>
                                                            <dt>2nd Step - Select Metrics you want to import to Table F</dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s2.jpg" />
                                                                <hr />
                                                            </dd>
                                                            <dt>3rd Step - Copy the Headers of the Metrics</dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s3.JPG" />
                                                                <hr />
                                                            </dd>
                                                            <dt>4th Step - Paste in the Text Area Below</dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s4.JPG" />
                                                                <hr />
                                                            </dd>
                                                            <dt>5th Step - Copy the Row where the Team value displays</dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s5.JPG" />
                                                                <hr />
                                                            </dd>
                                                            <dt>6th Step - Paste in a new line in the Text Area Below </dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s6.JPG" />
                                                                <hr />
                                                            </dd>
                                                            <dt>7th Step - Click Convert Button</dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s7.JPG" />
                                                                <hr />
                                                            </dd>
                                                            <dt>8th Step - Result will display </dt>
                                                            <dd>
                                                                <img src="../Images/TFH2/s8.JPG" />
                                                                <hr />
                                                            </dd>
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
                            </div>--%>
                            <!-- Manual -->
                            <div class="tab-pane fade" id="manual-pills">
                                <div id="manual-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Manual Input</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div id="manualtable" class="table-responsive">
                                            <asp:GridView
                                                ID="gridManual"
                                                runat="server"
                                                CssClass="table table-striped table-bordered"
                                                AutoGenerateColumns="false"
                                                ClientIDMode="Static">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Metrics"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Direction / Target"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ratings"></asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <hr />
                                            <div class="pull-right">
                                                <button id="step3-next" type="button" class="btn btn-success"><i class="fa fa-forward fa-fw"></i>Next</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Summary -->
                            <div class="tab-pane fade" id="summary-pills">
                                <div id="summary-panel" class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4>Summary</h4>
                                    </div>
                                    <div class="panel-body">
                                        <div id="summarytable" class="table-responsive">
                                            <asp:GridView
                                                ID="gridSummary"
                                                runat="server"
                                                CssClass="table table-striped table-bordered"
                                                AutoGenerateColumns="false"
                                                ClientIDMode="Static">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Metrics"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Direction / Target"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ratings"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Source"></asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                            <hr />
                                            <div class="pull-right">
                                                <button id="step4-next" type="button" class="btn btn-success"><i class="fa fa-forward fa-fw"></i>Next</button>
                                                <button id="commit-save" type="button" class="btn btn-success mbpshidden"><i class="fa fa-save fa-fw"></i>Commit & Save</button>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Commit and Save -->
                            <%--<div class="tab-pane fade" id="cs-pills">
                                <div class="panel-heading">
                                    <h4>Commit and Save</h4>
                                </div>
                                <div class="table-responsive">
                                        <div id="committable" class="table-responsive">
                                            <asp:GridView
                                                ID="gridCommit"
                                                runat="server"
                                                CssClass="table table-striped table-bordered"
                                                AutoGenerateColumns="false"
                                                ClientIDMode="Static">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Metrics"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Direction / Target"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Ratings"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Remarks"></asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Source"></asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                    <div class="pull-right">
                                        <button id="commit-save" type="button" class="btn btn-success"><i class="fa fa-save fa-fw"></i>Commit & Save</button>
                                    </div>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
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
                var x = 0;
                $('#start-wiz').click(function () {
                    if ($('#ddlDate').val() == 'Please select Month - Year...') {
                        alert('Please select Month - Year...');
                    }
                    else {
                        $('#ddlTeams').prop('disabled', true);
                        $('#ddlDate').prop('disabled', true);
                        $('#step-0').removeAttr("data-toggle");
                        $('#step-0').prop("href", "#");

                        $('#step-1').prop("href", "#ato-pills");
                        $('#step-1').attr("data-toggle", "tab");
                        $('#step-1').trigger("click");
                        $('#step-1').prop("href", "#");
                        $('#step-1').removeAttr("data-toggle");
                        ATODisplay();
                        ManualDisplay();
                    }
                })

                $('#step1-next').click(function () {
                    $('#step-3').prop("href", "#manual-pills");
                    $('#step-3').attr("data-toggle", "tab");
                    $('#step-3').trigger("click");
                    $('#step-3').prop("href", "#");
                    $('#step-3').removeAttr("data-toggle");
                    //$('#step-2').prop("href", "#pt-pills");
                    //$('#step-2').attr("data-toggle", "tab");
                    //$('#step-2').trigger("click");
                    //$('#step-2').prop("href", "#");
                    //$('#step-2').removeAttr("data-toggle");
                    
                    $("#gridATO tr").each(function () {
                        var teammetricid1 = $(this).find("#ddlmetricsato").val();
                        var ratings1 = $(this).find("td:eq(1)").text();
                        
                        if (teammetricid1 != undefined) {
                            if (teammetricid1 != '0') $("#ddlteammetrics option[value='" + teammetricid1 + "']").remove();
                            $("#gridManual tr").each(function () {
                                var teammetricid2 = $(this).find("input[type='hidden']").val();
                                if (teammetricid2 != undefined) {
                                    if (teammetricid1 == teammetricid2) {
                                        if (!isNaN(parseFloat(ratings1))) {
                                            $(this).remove();
                                        }
                                    }
                                }
                            });
                            
                            $("#gridSummary tr").each(function () {
                                var teammetricid2 = $(this).find("input[type='hidden']").val();
                                var ratings2 = $(this).find("#ratings");
                                var source2 = $(this).find("td:eq(4)");
                                if (teammetricid2 != undefined) {
                                    if (teammetricid1 == teammetricid2) {
                                        if (!isNaN(parseFloat(ratings1))) {
                                            ratings2.val(ratings1);
                                            source2.text('ATO 2.0');
                                        }
                                    }
                                }
                            });
                        }
                    });
                })

                $('#step2-next').click(function () {
                    $('#step-3').prop("href", "#manual-pills");
                    $('#step-3').attr("data-toggle", "tab");
                    $('#step-3').trigger("click");
                    $('#step-3').prop("href", "#");
                    $('#step-3').removeAttr("data-toggle");

                    $("#newbody tr").each(function () {
                        var teammetricid1 = $(this).find("#ddlmetricspt").val();
                        var ratings1 = $(this).find("td:eq(1)").text();

                        if (teammetricid1 != undefined) {
                            if (teammetricid1 != '0') $("#ddlteammetrics option[value='" + teammetricid1 + "']").remove();
                            $("#gridManual tr").each(function () {
                                var teammetricid2 = $(this).find("input[type='hidden']").val();
                                if (teammetricid2 != undefined) {
                                    if (teammetricid1 == teammetricid2) {
                                        $(this).remove();
                                    }
                                }
                            });

                            $("#gridSummary tr").each(function () {
                                var teammetricid2 = $(this).find("input[type='hidden']").val();
                                var ratings2 = $(this).find("#ratings");
                                var source2 = $(this).find("td:eq(4)");
                                if (teammetricid2 != undefined) {
                                    if (teammetricid1 == teammetricid2) {
                                        ratings2.val(ratings1);
                                        source2.text('PT Excel');
                                    }
                                }
                            });
                        }
                    });
                    
                })

                $('#step3-next').click(function () {
                    $('#step-4').prop("href", "#summary-pills");
                    $('#step-4').attr("data-toggle", "tab");
                    $('#step-4').trigger("click");
                    $('#step-4').prop("href", "#");
                    $('#step-4').removeAttr("data-toggle");
                    
                    $("#gridManual tr").each(function () {
                        var teammetricid1 = $(this).find("input[type='hidden']").val();
                        var ratings1 = $(this).find("#ratings").val();
                        if (teammetricid1 != undefined) {
                            $("#gridSummary tr").each(function () {
                                var teammetricid2 = $(this).find("input[type='hidden']").val();
                                var ratings2 = $(this).find("#ratings");
                                var source2 = $(this).find("td:eq(4)");
                                if (teammetricid2 != undefined) {
                                    if (teammetricid1 == teammetricid2) {
                                        if (!isNaN(parseFloat(ratings1))) {
                                            ratings2.val(ratings1);
                                            source2.text('Manual Entry');
                                        }
                                        else {
                                            source2.text('No Entry');
                                        }
                                    }
                                }
                            });
                        }
                    });
                })

                $('#step4-next').click(function () {
                    //$('#step-5').prop("href", "#cs-pills");
                    $('#step-5').attr("data-toggle", "tab");
                    $('#step-5').trigger("click");
                    $('#step-5').prop("href", "#");
                    $('#step-5').removeAttr("data-toggle");
                    $("#gridSummary tr").each(function () {
                        var ratings = $(this).find("#ratings");
                        var remarks = $(this).find("#remarks");
                        ratings.prop('disabled', 'disabled');
                        remarks.prop('disabled', 'disabled');
                    });
                    $('#step4-next').hide();
                    $('#commit-save').show();
                })

                $('#ddlTeams').change(function () {
                    //metricfudger();
                })

                $('#ddlDate').change(function () {
                    //if ($('#ddlDate').val() != 'Please select Month - Year...') {
                    //    RatingDisplay();
                    //}
                    //else {
                    //    metricfudger();
                    //}
                })

                $('#commit-save').click(function () {
                    var date = $('#ddlDate').val();
                    var dateparts = date.split(' - ');
                    var ratedate = dateparts[0] + ' 1, ' + dateparts[1];
                    $("#gridSummary tr").each(function () {
                        var teammetricid = $(this).find("input[type='hidden']").val();
                        var ratings = $(this).find("#ratings").val();
                        var remarks = $(this).find("#remarks").val();
                        //alert(teammetricid + ' ' + ratings);
                        if (teammetricid != undefined && ratings != '' && ratings != '-') {
                            if (!isNaN(parseFloat(ratings))) {
                                TeamRatingInsert(teammetricid, ratedate, parserating, remarks);
                            }
                        }
                    })
                    alert('Saved!');
                    DateDisplay('');
                    $('#ddlTeams').prop('disabled', '');
                    $('#ddlDate').prop('disabled', '');
                    $('#step4-next').show();
                    $('#commit-save').hide();

                    $('#step-0').prop("href", "#start-pills");
                    $('#step-0').attr("data-toggle", "tab");
                    $('#step-0').trigger("click");
                    $('#step-0').prop("href", "#");
                    $('#step-0').removeAttr("data-toggle");
                })

                $('#cancelrating').click(function () {
                    RatingDisplay();
                    $('#ddlTeams').prop('disabled', '');
                    $('#ddlDate').prop('disabled', '');
                    $('#editrating').show();
                    $('#newrating').hide();
                    $('#cancelrating').hide();
                    $("#gridManual tr").each(function () {
                        var ratings = $(this).find("#ratings");
                        var remarks = $(this).find("#remarks");
                        if (ratings != undefined) {
                            ratings.prop('disabled', true);
                            remarks.prop('disabled', true);
                        }
                    })
                })

                $('#editrating').click(function () {
                    if ($('#ddlDate').val() == 'Please select Month - Year...') {
                        alert('Please select Month, Year...');
                    }
                    else {
                        $('#ddlTeams').prop('disabled', true);
                        $('#ddlDate').prop('disabled', true);
                        $('#editrating').hide();
                        $('#newrating').show();
                        $('#cancelrating').show();
                        $("#gridManual tr").each(function () {
                            var ratings = $(this).find("#ratings");
                            var remarks = $(this).find("#remarks");
                            if (ratings != undefined) {
                                ratings.prop('disabled', '');
                                remarks.prop('disabled', '');
                            }
                        })
                    }
                })

                $('#dataInput').addClass('form-control');

                $('#ptupload').click(function () {
                    ptwindow();
                    //alert('Ely gawa ka ng new window dialog parang AIMS IQ Test tapos dun ilagay yung file upload tapos convert yung xls to DataTable tapos lagay sa Session tapos hugot data pabalik sa page na to');
                })

                $('#xmlconvrt').click(function () {
                    if (!$('#dataInput').val()) {
                        return;
                    }

                    $('#pttable').html($($('#dataOutput').val()));
                    $('#outputtable thead').remove();
                    
                    var t = $('#outputtable tbody').eq(0);
                    var r = t.find('tr');
                    var cols = r.length;
                    var rows = r.eq(0).find('td').length;
                    var cell, next, tem, i = 0;
                    var tb = $("<tbody id='newbody'></tbody>");
                    tb.append('<tr><th>PT Metrics</th><th>Ratings</th><th>Team Metrics</th></tr>');

                    while (i < rows) {
                        cell = 0;
                        tem = $('<tr></tr>');
                        while (cell < cols) {
                            next = r.eq(cell++).find('td').eq(0);
                            tem.append(next);
                        }
                        tb.append(tem);
                        ++i;
                    }
                    $('#outputtable').append(tb);
                    $('#outputtable').show();

                    $('#newbody').find('tr').each(function () {
                        if ($(this).index() > 0) {
                            var options = $("#ddlteammetrics").html();
                            $(this).append("<td><select id='ddlmetricspt' class='form-control ddlmetricspt'>" + options + "</select></td>");
                        }
                    })

                    $('#converter').hide();
                    $('#ptcommand').hide();
                    $('#pttable').show();
                    //var xmlDoc = $.parseXML($('#dataOutput').val());
                    //var xml = $(xmlDoc);
                    //var exkeys = xml.find("rows");
                    //alert(exkeys);
                    //$.each(exkeys, function () {
                    //    alert($(this).find("val0").text());
                    //})
                })

                $('#btnupload').click(function () {
                    alert($(this).prev().val());
                    uploadXLS();
                })
            })
        }

        DateDisplay('');

        function ptwindow() {
            var Mleft = (screen.width/2)-(760/2);
            var Mtop = (screen.height/2)-(700/2);
            window.open('PTMetric.aspx', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'');
        }

        function metricfudger() {
            $.ajax({
                type: "POST",
                url: "MyMetric.aspx/MetricDisplay",
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
                var exkeys = xml.find("Table1");
                var row = $("[id*=gridManual] tr:last-child").clone(true);
                $("[id*=gridManual] tr").not($("[id*=gridManual] tr:first-child")).remove();
                $.each(exkeys, function () {
                    var exkeys = $(this);
                    $("td", row).eq(0).html($(this).find("Metrics").text());
                    $("[id*=gridManual]").append(row);
                    $("td", row).eq(1).html($(this).find("TeamTarget").text());
                    $("[id*=gridManual]").append(row);
                    $("td", row).eq(2).html("<input id='ratings' class='form-control' disabled='disabled' placeholder='Rating' /> <input type='hidden' value='" + $(this).find("TeamMetricID").text() + "'/>");
                    $("[id*=gridManual]").append(row);
                    $("td", row).eq(3).html("<input id='remarks' class='form-control' disabled='disabled' placeholder='Remark' /> <input type='hidden' value='" + $(this).find("Source").text() + "'/>");
                    $("[id*=gridManual]").append(row);

                    row = $("[id*=gridManual] tr:last-child").clone(true);
                });

                $('#akeys').slideDown();
                $('#metrictable').slideDown();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
                $("[id*=gridManual] tr").not($("[id*=gridManual] tr:first-child")).remove();
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function floatkeypress(key) {
            $('.' + key).keypress(function (e) {
                if ((e.which < 46 || e.which > 57) && e.which != 8) {
                    e.preventDefault();
                } // prevent if not number/dot

                if (e.which == 46 && $(this).val().indexOf('.') != -1) {
                    e.preventDefault();
                } // prevent if already dot
            });
        }

        function DateDisplay(date) {
            $.ajax({
                type: "POST",
                url: "MyMetric.aspx/DateDisplay",
                data: '{teamid: ' + $('#ddlTeams').val() + ' }',
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
                $("#ddlDate").empty();
                $.each(exkeys, function () {
                    var newOption = "<option value='" + $(this).find("Dates").text() + "'>" + $(this).find("Dates").text() + "</option>";
                    $("#ddlDate").append(newOption);
                });
                if (date != '') {
                    $("#ddlDate").val(date);
                    RatingDisplay();
                }
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function ValidateRatings() {
            var valid = true;

            return valid;
        }

        function ManualDisplay() {
            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "MyMetric.aspx/ManualDisplay",
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
                var exkeys = xml.find("Table1");

                var row1 = $("[id*=gridManual] tr:last-child").clone(true);
                $("[id*=gridManual] tr").not($("[id*=gridManual] tr:first-child")).remove();

                var row2 = $("[id*=gridSummary] tr:last-child").clone(true);
                $("[id*=gridSummary] tr").not($("[id*=gridSummary] tr:first-child")).remove();

                $.each(exkeys, function () {
                    var exkeys = $(this);
                    $("td", row1).eq(0).html($(this).find("Metrics").text());
                    $("[id*=gridManual]").append(row1);
                    $("td", row1).eq(1).html($(this).find("TeamTarget").text());
                    $("[id*=gridManual]").append(row1);
                    $("td", row1).eq(2).html("<input id='ratings' class='form-control ratings' placeholder='Rating' /> <input type='hidden' value='" + $(this).find("TeamMetricID").text() + "'/> <input type='hidden' value='" + $(this).find("Source").text() + "'/>");
                    $("[id*=gridManual]").append(row1);
                    row1 = $("[id*=gridManual] tr:last-child").clone(true);

                    $("td", row2).eq(0).html($(this).find("Metrics").text());
                    $("[id*=gridSummary]").append(row2);
                    $("td", row2).eq(1).html($(this).find("TeamTarget").text());
                    $("[id*=gridSummary]").append(row2);
                    $("td", row2).eq(2).html("<input id='ratings' class='form-control ratings' placeholder='Ratings' /> <input type='hidden' value='" + $(this).find("TeamMetricID").text() + "'/>");
                    $("[id*=gridSummary]").append(row2);
                    $("td", row2).eq(3).html("<input id='remarks' class='form-control' placeholder='Remarks' /> <input type='hidden' value='" + $(this).find("Source").text() + "'/>");
                    $("[id*=gridSummary]").append(row2);
                    //$("td", row2).eq(4).html("<input id='sources' class='form-control' disabled='disabled' />");
                    //$("[id*=gridSummary]").append(row2);
                    row2 = $("[id*=gridSummary] tr:last-child").clone(true);
                });

                floatkeypress('ratings');
                //var output = [];
                //$("#gridSummary tr").each(function () {
                //    var metrictext = $(this).find('td:first').text();
                //    var metricvalue = $(this).find("input[type='hidden']").val();
                //    if (metricvalue != undefined) {
                //        output.push('<option value="' + metricvalue + '">' + metrictext + '</option>');
                //    }
                //});
                //$('#ddlteammetrics').html(output.join(''));
                //$('#ddlteammetrics').prepend("<option value='0'>Skip</option>");

                //$('#manualtable').slideDown();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
                $("[id*=gridManual] tr").not($("[id*=gridManual] tr:first-child")).remove();
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function PTDisplay() {
            $.ajax({
                type: "POST",
                url: "MyMetric.aspx/PTDisplay",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                var xmlDoc = $.parseXML(response.d);
                var xml = $(xmlDoc);
                var exkeys = xml.find("Table1");
                var row = $("[id*=gridPT] tr:last-child").clone(true);
                $("[id*=gridPT] tr").not($("[id*=gridPT] tr:first-child")).remove();
                $.each(exkeys, function () {
                    var exkeys = $(this);
                    $("td", row).eq(0).html($(this).find("Metrics").text());
                    $("[id*=gridPT]").append(row);
                    $("td", row).eq(1).html($(this).find("TeamTarget").text());
                    $("[id*=gridPT]").append(row);
                    $("td", row).eq(2).html("<input id='ratings' class='form-control' placeholder='Rating' /> <input type='hidden' value='" + $(this).find("TeamMetricID").text() + "'/> <input type='hidden' value='" + $(this).find("Source").text() + "'/>");
                    $("[id*=gridPT]").append(row);
                    //$("td", row).eq(3).html("<input id='remarks' class='form-control' placeholder='Remark' /> <input type='hidden' value='" + $(this).find("Source").text() + "'/>");
                    //$("[id*=gridPT]").append(row);

                    row = $("[id*=gridPT] tr:last-child").clone(true);
                });

                //$('#pttable').slideDown();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
                $("[id*=gridPT] tr").not($("[id*=gridPT] tr:first-child")).remove();
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function ATODisplay() {
            var dateparts = $('#ddlDate').val().split(' - ');
            var ratedate = dateparts[0] + ' 1, ' + dateparts[1];
            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            arr[1] = ratedate;
            $.ajax({
                type: "POST",
                url: "MyMetric.aspx/ATODisplay",
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

                var output = [];
                var exkeys2 = xml.find("Table2");
                $.each(exkeys2, function () {
                    var metrictext = $(this).find("Metrics").text();
                    var metricvalue = $(this).find("TeamMetricID").text();
                    output.push('<option value="' + metricvalue + '">' + metrictext + '</option>');
                });
                $('#ddlteammetrics').html(output.join(''));
                $('#ddlteammetrics').prepend("<option value='0'>Skip</option>");

                var exkeys = xml.find("Table1");
                var row = $("[id*=gridATO] tr:last-child").clone(true);
                $("[id*=gridATO] tr").not($("[id*=gridATO] tr:first-child")).remove();
                $.each(exkeys, function () {
                    var exkeys = $(this);
                    $("td", row).eq(0).html($(this).find("Metrics").text());
                    $("[id*=gridATO]").append(row);
                    $("td", row).eq(1).html($(this).find("Rating").text());
                    $("[id*=gridATO]").append(row);
                    var options = $("#ddlteammetrics").html();
                    $("td", row).eq(2).html("<select id='ddlmetricsato' class='form-control'>" + options + "</select> <input type='hidden' value='" + $(this).find("TeamMetricID").text() + "'/>");
                    $("[id*=gridATO]").append(row);
                    row = $("[id*=gridATO] tr:last-child").clone(true);
                });
                $("#gridATO tr").each(function () {
                    var teammetrics = $(this).find('#ddlmetricsato');
                    if (teammetrics.val() != undefined) {
                        var teammetricid = $(this).find("input[type='hidden']").val();
                        teammetrics.val(teammetricid);
                    }
                });

                //$('#atotable').slideDown();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
                $("[id*=gridATO] tr").not($("[id*=gridATO] tr:first-child")).remove();
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function RatingDisplay() {
            //xxx();
            var dateparts = $('#ddlDate').val().split(' - ');
            var ratedate = dateparts[0] + ' 1, ' + dateparts[1];
            $("#gridManual tr").each(function () {
                var teammetricid = $(this).find("input[type='hidden']").val();
                var ratings = $(this).find("#ratings");
                var remarks = $(this).find("#remarks");
                if (teammetricid != undefined) {
                    var arr = new Array();
                    arr[0] = teammetricid;
                    arr[1] = ratedate;
                    $.ajax({
                        type: "POST",
                        url: "MyMetric.aspx/RatingDisplay",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ _arr: arr }),
                        dataTaype: "json",
                        success: function (response) {
                            var xmlDoc = $.parseXML(response.d);
                            var xml = $(xmlDoc);
                            var exkeys = xml.find("Table1");
                            var exkeys1 = exkeys.find("Rating").text();
                            var exkeys2 = exkeys.find("Remarks").text();
                            ratings.val(exkeys1);
                            remarks.val(exkeys2);
                        },
                        error: function (response) {
                            alert(response.status + ' ' + response.statusText);
                        },
                        failure: function (response) {
                            alert(response.status + ' ' + response.statusText);
                        }
                    });
                }
            })
        }

        function TeamRatingInsert(teammetricid, ratedate, rating, remarks) {
            var arr = new Array();
            arr[0] = teammetricid;
            arr[1] = ratedate;
            arr[2] = rating;
            arr[3] = remarks;
            arr[4] = '<%: Session["WDID"] %>';
            $.ajax({
                type: "POST",
                url: "MyMetric.aspx/TeamRatingInsert",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                //alert(response.d);
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }

        function xxx() {
            var target = document.getElementById('gridManual');
            spinner.spin(target);
        }

        function yyy() {
            spinner.stop();
        }
    </script>
</asp:Content>
