<%@ Page Title="VOC" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VOC.aspx.cs" Inherits="MBPS_Central.Tools.VOC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-microphone fa-fw"></i>Voice of the Customer (VOC)</h1>
                <div class="panel-heading">
                    <img class="col-lg-12 col-md-12 col-sm-12 col-xs-12" src="<%: ResolveUrl("~/Images/VOCIMG/VOC%20BANNER.jpg") %>" />
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="row">
            <hr />
            <div class="col-lg-6 col-md-6">
                <div class="panel panel-mgreen">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-cogs fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">Escalation Logs</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div>Log Sheet</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View More</span><input type="hidden" value="1" />
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="panel panel-jhblue">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-thumbs-up fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div class="huge">RAVE</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div>Lorem Ipsum</div>
                            </div>
                        </div>
                    </div>
                    <a href="#">
                        <div class="panel-footer">
                            <span class="pull-left">View More</span><input type="hidden" value="1" />
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
