<cfscript>
$ = application.serviceFactory.getBean('muraScope');
if ( structkeyexists(session, 'siteid') ) {
	$.init(session.siteid);
} else {
	$.init('default');
}
// restrict to Super Users
if ( not structkeyexists(session, 'siteID') or not $.currentUser().isLoggedIn() or not $.currentUser().isSuperUser() ) {
	location(application.configBean.getContext() & '/admin/', false);
}
</cfscript>
<cfsavecontent variable="body">
<h2>MuraGCal&trade; 2 Plugin</h2>
<p>MuraGCal2 is a plugin for <a href="http://getmura.com/" target="_blank">Mura CMS</a> which enables you to easily add a *public* Google Calendar to your page, and configure its properties and display options. This plugin allows you to combine/aggregate multiple *public* Google Calendars into one, with separate colors for each calendar's events.</p>
<p>
Version: 2.0.20120406<br />
Author: <a href="https://plus.google.com/u/0/108538698676550512948/about" target="_blank">Azadi Saryev</a><br />
Source: <a href="https://github.com/azadisaryev/MuraGCal2" target="_blank">https://github.com/azadisaryev/MuraGCal2</a><br />
License: <a href="http://www.apache.org/licenses" target="_blank">Apache License Version 2</a></p>
<p>&nbsp;</p>
<h3>Tested With:</h3>
<ul>
	<li>Mura CMS Core Version <strong>5.6.4859</strong></li>
	<li>Adobe ColdFusion <strong>9.0.1</strong></li>
	<li>Railo <strong>3.3.1</strong></li>
</ul>
<p>&nbsp;</p>
<h3>Installation</h3>
<p>Deploy as a regular Mura plugin. Do not forget to select at least one site under 'Site Assignment' on installation.</p>
<h3>Usage</h3>
<h4>In Mura Admin back-end</h4>
<h5>Adding new MuraGCal2 Calendar to a page:</h5>
<p>In the page you want to add a *public* Google Calendar to, click on 'Content Objects' tab. Select Plugins->MuraGCal2 Plugin->MuraGCal2 Calendar under 'Available Content Objects' and add it to desired content area. Configure the calendar properties and display options in the pop-up Configurator modal window.</p>
<h5>Editing existing MuraGCal2 Calendar</h5>
<p>On the page's Content Objects tab, double-click the MuraGCal2 Configurator object in its content area to edit its properties and display options.</p>
<h4>Edit existing calendar in Mura front-end</h4>
<p>Content editors can edit existing calendar's options using the front-end editor (if enabled). Hover over the MuraGCal2 plugin instance on the page and click the 'edit' button (pencil) to bring up the configurator and edit calendar's properties and display options.</p>

<h3>Configurator Options</h3>
<p>See <a href="https://github.com/azadisaryev/MuraGCal2#readme" target="_blank">ReadMe</a></p>

<p>&nbsp;</p>
<p>Enjoy!</p>
<p>Azadi Saryev</p>
</cfsavecontent>
<cfoutput>#$.getBean('pluginManager').renderAdminTemplate(body=body,pageTitle='')#</cfoutput>