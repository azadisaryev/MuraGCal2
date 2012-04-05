<cfcomponent output="false" extends="mura.plugin.plugincfc" hint="MuraGCal2 Plugin cfc"><cfscript>
variables.pluginConfig = "";
variables.author = "Azadi Saryev | azadi.saryev@gmail.com | https://github.com/azadisaryev/MuraGCal2";
variables.dateCreated = createDateTime(2012,04,06,03,10,0);
variables.pluginVersion = "2.0." & dateformat(variables.dateCreated, 'yyyymmdd');
variables.packageName = "MuraGCal2";

public any function init(pluginConfig="") {
	variables.pluginConfig = arguments.pluginConfig;
}

public void function install() {}

public void function update() {}

public void function delete() {}
</cfscript></cfcomponent>