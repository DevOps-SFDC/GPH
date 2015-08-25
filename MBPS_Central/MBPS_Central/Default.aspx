<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MBPS_Central._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <style>
        .alert-dismissable .close, .alert-dismissible .close {
            position: initial;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><i class="fa fa-dashboard fa-fw"></i>Dashboard</h1>
                <div class="panel-heading">
                    
                </div>
            </div>
            <div class="col-lg-12">
                <div class="jumbotron alert alert-success alert-dismissable">
                    <div class="clearfix"></div>
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <div class="clearfix"></div>
                    <h1>Welcome!</h1>
                    <p>
                        This is MBPS Central. A central self-service tool for managing your team, staff, workforce and reports.
                        <br />
                        You may manage your staff attendance and shift, team work tasks and non-processing tasks.
                    </p>
                    <p>
                        <a class="btn btn-primary btn-lg" role="button" data-dismiss="jumbotron">Learn more</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="panel panel-mgreen">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-3">
                                <i class="fa fa-sitemap fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit1" class="huge">My Team</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="kcrp">Team Management</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex1">
                        <div class="panel-footer">
                            <span class="pull-left">View More</span><input id="ex1h" type="hidden" value="1" />
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
                                <i class="fa fa-tasks fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit1" class="huge">OPT</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="kcrp">Operations Performance Tracker</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex1">
                        <div class="panel-footer">
                            <span class="pull-left">View More</span><input id="ex1h" type="hidden" value="1" />
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
                                <i class="fa fa-line-chart fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit1" class="huge">Reports</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="kcrp">Team Reports</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex1">
                        <div class="panel-footer">
                            <span class="pull-left">View More</span><input id="ex1h" type="hidden" value="1" />
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
                                <i class="fa fa-wrench fa-4x"></i>
                            </div>
                            <div class="col-xs-9 text-right">
                                <div id="exhibit4" class="huge">Tools</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 text-right">
                                <div id="crm">Other Tools</div>
                            </div>
                        </div>
                    </div>
                    <a href="#" id="ex4">
                        <div class="panel-footer">
                            <span class="pull-left">View More</span><input id="ex4h" type="hidden" value="4" />
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
