<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="body">
<h2>#variables.pluginConfig.getName()#</h2>
<p>MuraGCal2 Plugin v2.0.20120405</p>
<p>Plugin for <a href="http://getmura.com" target="_blank">Mura CMS</a> for displaying Google Calendars with per-instance configuration.</p>
<p>@version: 2.0.20120405</p>
<p>@license: <a href="http://www.apache.org/licenses" target="_blank">Apache License Version 2</a></p>
<p>@author: <a href="https://plus.google.com/u/0/108538698676550512948/about" target="_blank">Azadi Saryev</a></p>
<p>@source: <a href="https://github.com/azadisaryev/MuraGCal2" target="_blank">https://github.com/azadisaryev/MuraGCal2</a></p>
<p>@readme: <a href="https://github.com/azadisaryev/MuraGCal2#readme" target="_blank">https://github.com/azadisaryev/MuraGCal2#readme</a></p>
<p></p>
</cfsavecontent>
<cfoutput>#application.pluginManager.renderAdminTemplate(body=body,pageTitle=request.pluginConfig.getName())#</cfoutput>