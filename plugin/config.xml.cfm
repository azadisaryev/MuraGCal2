<cfoutput>
<plugin>
	<name>MuraGCal 2 Plugin</name>
	<package>MuraGCal2</package>
	<directoryFormat>packageOnly</directoryFormat>
	<version>2.0.20120405</version>
	<provider>Azadi Saryev</provider>
	<providerURL>https://azadisaryev@github.com/azadisaryev/MuraGCal2.git</providerURL>
	<category>Application</category>
	<ormCFCLocation></ormCFCLocation>
	<customTagPaths></customTagPaths>
	<autoDeploy>false</autoDeploy>
	<siteID></siteID>
	<settings />
	<eventHandlers />
	<displayobjects location="global">
		<displayobject name="MuraGCal2 Calendar" 
		displaymethod="dspMuraGCalObject" 
		component="displayObjects.displayObjects"
		configuratorInit="initMuraGCalConfigurator"
		configuratorJS="displayObjects/configurators/configuredObject/muragcal2_configurator.min.js"
		persist="false" />
	</displayobjects>
</plugin>
</cfoutput>