<!--
* 
* This file is part of MuraGCal2 TM
* (c) Azadi Saryev | https://plus.google.com/108538698676550512948
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*
-->
<cfoutput>
<plugin>
	<name>MuraGCal 2 Plugin</name>
	<package>MuraGCal2</package>
	<directoryFormat>packageOnly</directoryFormat>
	<version>2.0.20120518</version>
	<provider>Azadi Saryev</provider>
	<providerURL>https://github.com/azadisaryev/MuraGCal2</providerURL>
	<category>Utility</category>
	<ormCFCLocation></ormCFCLocation>
	<customTagPaths></customTagPaths>
	<autoDeploy>false</autoDeploy>
	<siteID></siteID>
	<settings />
	<eventHandlers />
	<displayobjects location="global">
		<displayobject
			name="MuraGCal2 Calendar" 
			displaymethod="dspMuraGCalObject" 
			component="displayObjects.displayObjects"
			configuratorInit="initMuraGCalConfigurator"
			configuratorJS="displayObjects/configurators/configuredObject/muragcal2_configurator.js"
			persist="false" 
		/>
	</displayobjects>
</plugin>
</cfoutput>