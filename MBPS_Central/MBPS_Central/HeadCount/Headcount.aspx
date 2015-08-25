<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Headcount.aspx.cs" Inherits="MBPS_Central.Headcount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        #gridHC > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridHC > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color: #333;
        }
        #gridFC > thead > tr:first-child {
            background: #00693C !important;
            color: #fff;
        }

        #gridFC > tbody > tr:first-child {
            background: none repeat scroll 0 0 #fff !important;
            color: #333;
        }
         #Forecast .modal-dialog  {
             width:75%;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-signal fa-fw"></i>HeadCount Actual/Forecast</h1>
                <div class="panel-heading">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="panel-heading">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <input id="txtactual" type="hidden" value="Actual" />
                        <input id="txtforecast" type="hidden" value="Forecast" />
                        <div class="col-md-6 form-group">
                            <label>Team Selection</label>
                            <asp:DropDownList
                                ID="ddlTeams"
                                runat="server"
                                ClientIDMode="Static"
                                CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3 form-group pull-right">
                            <label>Year</label>
                            <select id="ddlyear1" class="form-control">
                                <option value="0">Please Select Year...</option>
                                <option value="2015">2015</option>
                                <option value="2014">2014</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 id="heacount">HeadCount</h4>
            </div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table id="gridHC" class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 10%">HeadCount</th>
                                <th>Jan</th>
                                <th>Feb</th>
                                <th>Mar</th>
                                <th>Apr</th>
                                <th>May</th>
                                <th>Jun</th>
                                <th>Jul</th>
                                <th>Aug</th>
                                <th>Sep</th>
                                <th>Oct</th>
                                <th>Nov</th>
                                <th>Dec</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
                 <div class="table-responsive">
                   
                </div>
                <div class="modal fade" id="Headcount" tabindex="-1" role="dialog" aria-labelledby="myModalEmp" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="HeadcounX"><span id="Headcoun">List of Employee</span></h4>
                            </div>
                            <div class="modal-body">
                                <asp:GridView
                                    ID="GridView1"
                                    runat="server"
                                    CssClass="table table-bordered"
                                    AutoGenerateColumns="false"
                                    ClientIDMode="Static">

                                    <Columns>
                                        <%--<asp:TemplateField HeaderText="No" HeaderStyle-Width="10%">
                                           <ItemTemplate>
                                                <asp:Label ID="num" runat="server" Text='<%#Container.DataItemIndex + 1 %>'></asp:Label></ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="WorkdayID" HeaderStyle-Width="30%"></asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee Name"></asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button id="button" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="Forecast" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel1"><span id="forecast">Add Forecast</span></h4>
                            </div>
                            <div class="modal-body">

                                <table id="gridFC" class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                                <dl>
                                    <dt>Position</dt>
                                    <dd class="form-group">
                                        <div class="col-md-12">
                                           <input id="txtMonth" class="form-control" type="hidden" />
                                            <input id="txtPosition" class="form-control"/>
                                        </div>
                                    </dd>
                                    <dt>Count</dt>
                                    <dd class="form-group">
                                        <div class="col-md-4">
                                            <input id="txtCount" class="form-control"/>
                                        </div>
                                    </dd>
                                </dl>
                            </div>
                            <div class="clearfix"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button id="btnFC" type="button" class="btn btn-success" data-dismiss="modal">Save</button>
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
                //displayHeadcount();
                displayYear();
                displayHCActualForecast();
               

                $('#btnadd').click(function () {
                    $('#AddEmployee').modal('show');
                })
                $("#ddlTeams").change(function () {
                    
                    displayHCActualForecast();
                })
                $('#ddlyear1').change(function () {
                  
                    displayHCActualForecast();
                    
                })
                $('#btnFC').click(function () {
                   // if ($('#txtCount').val() != "") {
                        insertEmp();
                      //  return true;
                   // }
                   // else {
                      //  alert('Please input in the Number in count')
                       // return false;
                    //}
                })
            })
        }
        function insertEmp() {
            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            arr[1] = $('#txtPosition').val();
            arr[2] = $('#ddlyear').val();
            arr[3] = $('#txtMonth').val();
            arr[4] = $('#ddlTeams').text();
            //arr[5] = $('#txtCount').val();
           
            $.ajax({
                type: "POST",
                url: "Headcount.aspx/addForecast",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataTaype: "json",
                success: AjaxSucceeded,
                error: AjaxError,
                failure: AjaxFailure
            });

            function AjaxSucceeded(response) {
                displayHCActualForecast();
            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }

        }

        function displayemployee(id) {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            arr[1] = id;
            arr[2] = $('#ddlyear1').val();

            $.ajax({
                type: "POST",
                url: "Headcount.aspx/displayemployee",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {
                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var HC = xml.find("Table1");
                    var row = $("[id*=GridView1] tr:last-child").clone(true);
                    $("[id*=GridView1] tr").not($("[id*=GridView1] tr:first-child")).remove();
                    $.each(HC, function () {
                        var HC = $(this);
                        var rowscount = $("#GridView1 tr").length + 1;

                        //$("td", row).eq(0).html($(this).find("rowscount").text());
                        //$("[id*=GridView1]").append(row);
                        $("td", row).eq(0).html($(this).find("WokdayID").text());
                        $("[id*=GridView1]").append(row);
                        $("td", row).eq(1).html($(this).find("Name").text());
                        $("[id*=GridView1]").append(row);
                        row = $("[id*=GridView1] tr:last-child").clone(true);
                    });

                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }

        function displayHCActualForecast() {

            $('#gridHC > tbody > tr').remove();

            var arr = new Array();
            arr[0] = $("#ddlTeams").val();
            arr[1] = $("#ddlyear1").val();
            //arr[2] = $("#txtforecast").val();
            $.ajax({
                type: "POST",
                url: "Headcount.aspx/displayHC",
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
                var FC = xml.find("Table1");

                $.each(FC, function () {
                    var FC = $(this);
                    x = new String($(this).find("Year").text());
                   
                    if (x === '') {
                     alert('1')
                    } else {
                        $("[id*=gridHC] tbody").append(
                     "<tr>" + "<td>" + $(this).find("actual").text() + "</td>" +
                     "<td>" + "<input type='hidden' value='1'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("jan").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='2'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("feb").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='3'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("mar").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='4'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("apr").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='5'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("may").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='6'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("jun").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='7'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("jul").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='8'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("aug").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='9'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("sep").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='10'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("oct").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='11'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("nov").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='12'/><a class='HC' href='#' data-toggle='modal' data-target='#Headcount'><i class='fa fa-search fa-fw'></i>" + $(this).find("dec").text() + "</a>" + "</td>" +

                     "</tr>" + "<tr>" + "<td>" + $(this).find("forecast").text() + "</td>" +
                     "<td>" + "<input type='hidden' value='1'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("janF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='2'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("febF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='3'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("marF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='4'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("aprF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='5'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("mayF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='6'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("junF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='7'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("julF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='8'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("augF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='9'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("sepF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='10'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("octF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='11'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("novF").text() + "</a>" + "</td>" +
                     "<td>" + "<input type='hidden' value='12'/><a class='FC' href='#' data-toggle='modal' data-target='#Forecast'><i class='fa fa-plus fa-fw'></i>" + $(this).find("decF").text() + "</a>" + "</td>"
                     + "</tr>");
                    }
                });
                $('.HC').click(function () {
                    displayemployee($(this).prev().val());
                })
                $('.FC').click(function (event) {
                    $('#txtMonth').val($(this).prev().val());
                })

            }
            function AjaxError(response) {
                alert(response.status + ' ' + response.statusText);
            }
            function AjaxFailure(response) {
                alert(response.status + ' ' + response.statusText);
            }
        }
       
        function displayYear() {

            var arr = new Array();
            arr[0] = $('#ddlTeams').val();
            $.ajax({
                type: "POST",
                url: "Headcount.aspx/displayYear",
                data: JSON.stringify({ _arr: arr }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function AjaxSucceded(response) {

                    var xmlDoc = $.parseXML(response.d);
                    var xml = $(xmlDoc);
                    var parents = xml.find("Table1");
                    $.each(parents, function () {
                        var parents = $(this);
                        var o = new Option($(this).find("date").text(), $(this).find("date").text())
                        $(o).html($(this).find("date").text());
                        $('#ddlyear').append(o);
                    });


                },
                error: function AjaxError(response) { alert(response.status + ' ' + response.responseText); },
                failure: function AjaxFailure(response) { response.status + ' ' + response.statusText; }
            });
        }
    </script>
</asp:Content>
