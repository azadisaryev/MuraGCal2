<cfscript>
$ = application.serviceFactory.getBean('muraScope');
if ( structkeyexists(session, 'siteid') ) {
	$.init(session.siteid);
} else {
	$.init('default');
}
// restrict to Super Users
if ( not structkeyexists(session, 'siteID') or not $.currentUser().isLoggedIn() or not $.currentUser().isSuperUser() ){
	location(application.configBean.getContext() & '/admin/', false);
}
</cfscript>
<cfsavecontent variable="body">
<h2>MuraGCal&trade; 2 Plugin</h2>
<p>
Version: 2.0.20120406<br />
Author: <a href="https://plus.google.com/u/0/108538698676550512948/about" target="_blank">Azadi Saryev</a><br />
Source: <a href="https://github.com/azadisaryev/MuraGCal2" target="_blank">https://github.com/azadisaryev/MuraGCal2</a><br />
License: <a href="http://www.apache.org/licenses" target="_blank">Apache License Version 2</a></p>
<p>&nbsp;</p>
<h4>Tested With:</h4>
<ul>
	<li>Mura CMS Core Version <strong>5.6.4859</strong></li>
	<li>Adobe ColdFusion <strong>9.0.1</strong></li>
	<li>Railo <strong>3.3.1</strong></li>
</ul>
</cfsavecontent>
<cfoutput>#$.getBean('pluginManager').renderAdminTemplate(body=body,pageTitle='')#</cfoutput>