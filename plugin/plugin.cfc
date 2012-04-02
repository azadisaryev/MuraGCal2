<cfcomponent output="false" extends="mura.plugin.plugincfc" hint="MuraGCal2 Plugin cfc"><cfscript>
variables.pluginConfig = "";
variables.author = "Azadi Saryev | azadi.saryev@gmail.com | https://azadisaryev@github.com/azadisaryev/MuraGCal2.git";
variables.pluginVersion = "2.0.20120402";
variables.dateCreated = createDateTime(2012,04,02,0,0,0);
variables.packageName = "MuraGCal2";

public any function init(pluginConfig="") {
	variables.pluginConfig = arguments.pluginConfig;
}

public void function install() {}

public void function update() {}

public void function delete() {}
</cfscript></cfcomponent>