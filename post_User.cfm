<!---<cfdump var="#form#"><cfabort>?--->
<cfscript>
	function convert2NULL(str) {
		var s = replace(str,"'","","all");
		if(s == "")
			return "NULL";
		else
			return str;
	}
</cfscript>
<!--- creating the action form --->
<cfif isDefined("form.hdnUserID") AND isNumeric(form.hdnUserID)>

	<cfif form.hdnUserID EQ 0>

<cfset SqlCol = "UserName">
<cfset SqlCol1 = "Admin">
<cfset SqlCol2 = "Password">
<cfset SqlCol3 = "AddrEmail">
<cfset SqlCol4 = "SalesRep">
<cfset SqlCol5 = "OverrideLockout">
<cfset SqlCol6 = "ShowAlert">
<cfset SqlCol7 = "Customer">
<cfset SqlCol8 ="DistributionCenterAccess">
<cfset SqlCol9 ="LocationAccess">

<cfquery name="qryInsertSalesRep" datasource="#session.dsn#"  result="res"  >

INSERT INTO tbl_users (#SqlCol#, #SqlCol2#, #SqlCol3#, #SqlCol1#, #SqlCol4#, #SqlCol5#, #SqlCol6#, #SqlCol7#, #SqlCol8#, #SqlCol9#, createdon, createdby)
VALUES (
	
	<cfqueryparam value="#form.txtUserName#" cfsqltype="cf_sql_varchar">,
	password(<cfqueryparam value="#form.txtPassword#" cfsqltype="cf_sql_varchar">),
	<cfqueryparam value="#form.txtAddrEmail#" cfsqltype="cf_sql_varchar">,
	<cfqueryparam value="#form.cbAdminYes#" cfsqltype="cf_sql_tinyint">,
	<cfqueryparam value="#form.cbSalesRepYes#" cfsqltype="cf_sql_tinyint">,
	<cfqueryparam value="#form.cbOverrideLockoutYes#" cfsqltype="cf_sql_tinyint">,
	<cfqueryparam value="#form.cbShowAlertYes#" cfsqltype="cf_sql_tinyint">,
	<cfqueryparam value="#form.selCustomerPriv#" cfsqltype="cf_sql_tinyint">, 
	<cfqueryparam value="#form.distributioncenters#" cfsqltype="cf_sql_varchar">,
	<cfqueryparam value="#form.loc#" cfsqltype="cf_sql_varchar">,
	<cfqueryparam value="#createODBCDateTime(Now())#" cfsqltype="cf_sql_timestamp">,
	<cfqueryparam value="#session.userID#" cfsqltype="cf_sql_integer">

)
		</cfquery>
		


	<cfelse>

	<cfset SqlCol = "UserName">
	<cfset SqlCol1 = "Admin">
	<cfset SqlCol2 = "Password">
	<cfset SqlCol3 = "AddrEmail">
	<cfset SqlCol4 = "SalesRep">
	<cfset SqlCol5 = "OverrideLockout">
	<cfset SqlCol6 = "ShowAlert">
	<cfset SqlCol7 = "Customer">
	<cfset SqlCol8 ="DistributionCenterAccess">
	<cfset SqlCol9 ="LocationAccess">

	<cfquery name="qryUpdateUser" datasource="#session.dsn#"  result="res"  >
	
		UPDATE tbl_users
		SET UserName = <cfqueryparam value="#form.txtUserName#" cfsqltype="cf_sql_varchar">,
			<cfif form.realpw NEQ form.txtPassword >
			Password = password(<cfqueryparam value="#form.txtPassword#" cfsqltype="cf_sql_varchar">),
			</cfif>
			AddrEmail = <cfqueryparam value="#form.txtAddrEmail#" cfsqltype="cf_sql_varchar">,     
			Admin = <cfqueryparam value="#form.cbAdminYes#" cfsqltype="cf_sql_tinyint">,
			SalesRep = <cfqueryparam value="#form.cbSalesRepYes#" cfsqltype="cf_sql_tinyint">,
			OverrideLockout = <cfqueryparam value="#form.cbOverrideLockoutYes#" cfsqltype="cf_sql_tinyint">,
			ShowAlert = <cfqueryparam value="#form.cbShowAlertYes#" cfsqltype="cf_sql_tinyint">,
			Customer = <cfqueryparam value="#form.selCustomerPriv#" cfsqltype="cf_sql_tinyint">,
			DistributionCenterAccess = <cfqueryparam value="#form.distributioncenters#" cfsqltype="cf_sql_varchar">,
			LocationAccess = <cfqueryparam value="#form.loc#" cfsqltype="cf_sql_varchar">,
			editedby=<cfqueryparam value="#session.userID#" cfsqltype="cf_sql_integer">
		WHERE UserID = <cfqueryparam value="#form.hdnUserID#" cfsqltype="cf_sql_integer">
	</cfquery>
	
	</cfif>
	<cfset success = "t">
	<cfset msg = "User saved successfully">
</cfif>

<cflocation url="../../?do=User&success=#success#&msg=#urlEncodedFormat(msg)#" addtoken="false">





























































































