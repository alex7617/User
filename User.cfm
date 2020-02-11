
<cfif (isDefined("url.add") OR isDefined("url.edit")) AND (isDefined("url.sr") AND isNumeric(url.sr))>
    <!--- ---------------------------------------------------------------------------------- --->
    <!---                       SALES REP - START                                  --->
    <!--- Quering the database where the sales rep id matches what is was entered in the url                  --->
        <cfquery name="qryUsers" datasource="#session.dsn#">
            SELECT UserID, UserName, Admin, AddrEmail, Password, LastLogin, SalesRep, OverrideLockout, Customer, ShowAlert, DistributionCenterAccess, LocationAccess
            FROM tbl_users 
            WHERE UserID = #url.sr#
		</cfquery>
	
        	<!--- able to hide and show the password.--->
			<script src="js/download/jquery.download.js"></script>
			<script type="text/javascript">
			$(document).ready(function () {
				$('#cbShowPassword').click(function () {
					var currentPasswordField = $('#txtPassword');
					var currentPassword = currentPasswordField.val();
					currentPasswordField.remove();
					if($(this).is(':checked'))
					{
						$(this).before('<input type="text" size="50" id="txtPassword" name="txtPassword" value="' + currentPassword + '">    ');
	
					}
					else 
					{
						$(this).before('<input type="password" size="50" id="txtPassword" name="txtPassword" value="' + currentPassword + '">    ');
					}
					
				});
				
			});

	
</script>
		
	</head>
	<script src="js/download/jquery.download.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$('#cbAdminYes').click(function () {
		
			if($(this).is(':checked'))
			{
				$('#cbAdminNo').attr("disabled", true);
			}
			else{
				$('#cbAdminNo').removeAttr("disabled");

			}
		
			
		});
		
	});
</script>
	<script src="js/download/jquery.download.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
		$('#cbSalesRepYes').click(function () {
		
			if($(this).is(':checked'))
			{
				$('#cbSalesRepNo').attr("disabled", true);
			}
			else{
				$('#cbSalesRepNo').removeAttr("disabled");

			}
		
			
		});
		
	});

</script>

<script src="js/download/jquery.download.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#cbOverrideLockoutYes').click(function () {
	
		if($(this).is(':checked'))
		{
			$('#cbOverrideLockoutNo').attr("disabled", true);
		}
		else{
			$('#cbOverrideLockoutNo').removeAttr("disabled");

		}
	
		
	});
	
});

</script>

<script src="js/download/jquery.download.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#cbShowAlertYes').click(function () {
	
		if($(this).is(':checked'))
		{
			$('#cbShowAlertNo').attr("disabled", true);
		}
		else{
			$('#cbShowAlertNo').removeAttr("disabled");

		}
	
		
	});
	
});

</script>


	  


</script>
    <!---       creating the session for the user.Is referencing the post form that is processing the action on the post file.                                  --->
        <cfoutput>
            
		<form id="frmSalesRep" name="frmSalesRep" action="admin/User/post_User.cfm" method="post">
			
            <cfif qryUsers.UserID EQ "">
                <input type="hidden" name="hdnUserID" value="0">
                
            <cfelse>
                <input type="hidden" name="hdnUserID" value="#qryUsers.UserID#">
			</cfif>
			
		
            <table id="salesreptable" cellpadding="2" cellspacing="0" border="1" rules="none" frame="void" style="border-color:##DDDDDD">
                <tr>
                    <td align="right">
                        <label for="txtUserName">User Name: </label>  
                    </td>
                    <td colspan="4">
                        <input type="text" id="txtUserName" name="txtUserName" required="true" size="50" maxlength="35" value="#qryUsers.UserName#"> <label>Last Login: </label>#qryUsers.LastLogin#    
					</td>
					
                </tr>
				
					<tr>
                        <td align="right">
							<label for="txtPassword">Password: </label>
							
                        </td>
                        <td colspan="2">
							<input type="password" id="txtPassword" name="txtPassword" required="true" size="50" maxlength="35" value="#qryUsers.Password#"/> <input type="checkbox"  id="cbShowPassword" > 
							<input type="hidden" id="realpw" name="realpw" value="#qryUsers.Password#">
							<label for="cbShowPassword">Show Password </label>
							
						</td>
						
					
                    </tr>
					<tr>
						<td align="right">
							<label for="txtAddrEmail">User Login: </label>
						</td>
						<td colspan="2">
							<input type="text" id="txtAddrEmail" name="txtAddrEmail" required="true" size="50" maxlength="35" value="#qryUsers.AddrEmail#">
						</td>
					</tr>
					
					<tr>
						
						<td align="right">
							<label for="cbAdminYes">Admin:</label> 
						</td>
					
						<td>
							
						
							<cfif  isDefined("form.cbAdminYes")>
								<input type="checkbox" name="cbAdminYes"  id="cbAdminYes" value="1" <cfif qryUsers.Admin EQ 1 >checked</cfif>>
							
							<cfelse>
								<input type="checkbox" name="cbAdminYes"  id="cbAdminYes" value="1" <cfif qryUsers.Admin EQ 1 >checked</cfif>>
								<input type="hidden" name="cbAdminYes"  id="cbAdminNo" value="0" <cfif qryUsers.Admin EQ 1 >disabled</cfif>>
						</cfif>
						
						</td>
					</tr>
						
						<tr>
							<td align="right">
								<label for="cbSalesRepYes">Sales Rep:</label> 
							</td>
							<td>
								<cfif  isDefined("form.cbSalesRepYes")>
									<input type="checkbox" name="cbSalesRepYes"  id="cbSalesRepYes" value="1" <cfif qryUsers.SalesRep EQ 1 >checked</cfif>>
								
								<cfelse>
									<input type="checkbox" name="cbSalesRepYes"  id="cbSalesRepYes" value="1" <cfif qryUsers.SalesRep EQ 1 >checked</cfif>>
									<input type="hidden" name="cbSalesRepYes"  id="cbSalesRepNo" value="0" <cfif qryUsers.SalesRep EQ 1 >disabled</cfif>>
								</cfif>
							</td>
							
						</tr>
		
				
						<tr>
							<td align="right">
								<label for="cbOverrideLockoutYes">Override Lockout:</label> 
							</td>
							<td>
								<cfif  isDefined("form.cbOverrideLockoutYes")>
									<input type="checkbox" name="cbOverrideLockoutYes"  id="cbOverrideLockoutYes" value="1" <cfif qryUsers.OverrideLockout EQ 1 >checked</cfif>>
								
								<cfelse>
									<input type="checkbox" name="cbOverrideLockoutYes"  id="cbOverrideLockoutYes" value="1" <cfif qryUsers.OverrideLockout EQ 1 >checked</cfif>>
									<input type="hidden" name="cbOverrideLockoutYes"  id="cbOverrideLockoutNo" value="0" <cfif qryUsers.OverrideLockout EQ 1 >disabled</cfif>>
								</cfif>
							</td>
							
						</tr>
					
						<tr>
							<td align="right">
								<label for="cbShowAlertYes">Show Alert:</label> 
							</td>
							<td>
								<cfif  isDefined("form.cbShowAlertYes")>
									<input type="checkbox" name="cbShowAlertYes"  id="cbShowAlertYes" value="1" <cfif qryUsers.ShowAlert EQ 1 >checked</cfif>>
								
								<cfelse>
									<input type="checkbox" name="cbShowAlertYes"  id="cbShowAlertYes" value="1" <cfif qryUsers.ShowAlert EQ 1 >checked</cfif>>
									<input type="hidden" name="cbShowAlertYes"  id="cbShowAlertNo" value="0" <cfif qryUsers.ShowAlert EQ 1 >disabled</cfif>>
								</cfif>
							</td>
							
						</tr>
						
						
						<tr>
						<td align="right" <!---style="border-bottom:thin solid #DDDDDD;"--->>
						
							<label for="selCustomerPriv">Customer Privilege: </label>
						</td>
							<td>		
							<select id="selCustomerPriv" name="selCustomerPriv">
								<option value="0" selected>0</option>
								<option value="1" <cfif qryUsers.Customer EQ 1 >selected</cfif>>1</option>
								<option value="2" <cfif qryUsers.Customer EQ 2 >selected</cfif>>2</option>
								<option value="3" <cfif qryUsers.Customer EQ 3 >selected</cfif>>3</option>
							</select>
						</td>
					</tr> 
        
        
        <!--- the checkbox for whether they are active or not. Was deleted --->
          <!--- edited the colspan to 4 instead of 2--->
               
			
		<!--- form goes here --->
	
		</cfoutput>
		
        <script type="text/javascript" src="js/download/jquery.download.js"></script>
					<script type="text/javascript">
						//Code taken from      what is this?
						//http://www.1stwebdesigns.com/blog/development/multiple-select-with-checkboxes-and-jquery
						jQuery.fn.multiselect = function() {
							$(this).each(function() {
								var checkboxes = $(this).find("input:checkbox");
								checkboxes.each(function() {
									var checkbox = $(this);
									// Highlight pre-selected checkboxes
									if (checkbox.attr("checked"))
										checkbox.parent().addClass("multiselect-on");
						 
									// Highlight checkboxes that the user selects
									checkbox.click(function() {
										if (checkbox.attr("checked"))
											checkbox.parent().addClass("multiselect-on");
										else
											checkbox.parent().removeClass("multiselect-on");
									});
								});
							});
						};
							
						$(document).ready(function() { 
							$(function() {
								 $(".multiselect").multiselect();
							});
					
							var $btnFacility = $('#facility');
							$btnFacility.unbind('change').change(function() {
									uncheckCheckAll();
									loadLocations();
							});
							loadLocations();
							var $btnLocations = $('#locations');
							$btnLocations.unbind('change').change(function() {
									uncheckCheckAll();
							});
							
							$('#btnSubmit').button(
							  {
								label: 'Save',
								//icons: {primary: 'ui-icon-excel', secondary: null}
							  }
							).css('width','110px');
							$('#btnCancel').button(
							  {
								label: 'Cancel',
								//icons: {primary: 'ui-icon-excel', secondary: null}
							  }
							).css('width','110px');
					
					
							$('#btnSubmit').unbind('click').click(function(e) {
								e.preventDefault();
								var username = $('#txtUserName').val();
								var email = $('#txtAddrEmail').val();
								var password = $('#txtPassword').val();
								var indexat = email.indexOf("@"); //Index of "@" in the email field
								var indexdot = email.indexOf("."); //Index of "." in the email field
								if(username == '')
								{
									alert('Please enter your UserName');
									$('#txtUserName').focus(); //The focus function will move the cursor to "fullname" field
									return false;
								}
   							else if(password == '')
   								{
									alert('Please enter your Password');
									  $('#txtPassword').focus();
									  return false;
   								}
   								else if(email == '')
   								{
									alert('Please enter your User Login');
									  $('#txtAddrEmail').focus();
									  return false;
								   }
								
								var csid = $('#facility').find('[name="option[]"]:CHECKED').map(function() {
								  return this.value;
								}).get().join(',');
								
								if(csid.length > 0) {
									$('#distributioncenters').val(csid);
								} else {
									alert('Please select at least one distribution center');
									return false;
								}
							<!---	$('#frmSalesRep').submit(); --->

								
								var lid = $('#locations').find('[name="option[]"]:CHECKED').map(function() {
								  return this.value;
								}).get().join(',');
								
								if(lid.length > 0) {
									$('#loc').val(lid);
								}
								
								$('#frmSalesRep').submit();
							
							});
							
							$('#cbCheckAllFacility').unbind('change').change(function() {
								$('div#facility input[type="checkbox"]').prop("checked",$(this).prop("checked"));
								loadLocations();
								$('div#facility input[type="checkbox"]:CHECKED').parent().addClass("multiselect-on");
								$('div#facility input[type="checkbox"]:NOT(:CHECKED)').parent().removeClass("multiselect-on");
							});
							$('#cbCheckAllLocations').unbind('change').change(function() {
								$('div#locations input[type="checkbox"]').prop("checked",$(this).prop("checked"));
								$('div#locations input[type="checkbox"]:CHECKED').parent().addClass("multiselect-on");
								$('div#locations input[type="checkbox"]:NOT(:CHECKED)').parent().removeClass("multiselect-on");
							});
					
							function uncheckCheckAll() {
								$('#cbCheckAllFacility').removeAttr('checked');
								$('#cbCheckAllLocations').removeAttr('checked');
							}
						
							function loadLocations() {
								//Create a comma-delimted list of FacilityCodeIDs to pass to ajax
								var csid = $('div#facility').find('[name="option[]"]:CHECKED').map(function() {
								  return this.value;
								}).get().join(',');
							
								try {
									//cancel any previous ajax calls
									ajaxLocationRequest.abort();
								} catch(e){}
								
								//$('.ext_load').show();
								
								//At least one facility needs to be selected
								if(csid.length > 0) {
									ajaxLocationRequest = $.ajax({
											type: "get",
											url: "reports/ajax_buildMultiSelectList.cfm",
											cache: false,
											data: {
												method: "getExistingLocationsForUser",
												csid: csid
											},
											success: function( objResponse ){
												var list = $.trim(objResponse);
												$('div#locations').html(list);
												$('div#locations').multiselect();
												$('div#packs').html('');
												$('#cbCheckAllLocations').removeAttr('checked');
												$('#cbCheckAllPacks').removeAttr('checked');
												var lid = $('div#locations').find('[name="option[]"]');
												for(var i=0; i<lid.length; i++){
													
													if($('#sellocation').val().split(',').indexOf(lid[i].value) > -1){
														$(lid[i]).attr('checked','checked');

													}
													
												}
												
											},
											error: function( objRequest, strError ){
												if(objRequest.statusText!='abort') {
													alert( "An unknown connection error occurred." );
												}
											},
											complete: function() {
												//$('.ext_load').hide();
											}
									});
								} else {
									//Clear other lists
									$('div#locations').html('');
									$('div#packs').html('');
									$('#cbCheckAllLocations').removeAttr('checked');
									$('#cbCheckAllPacks').removeAttr('checked');
						
								}
							}
						});
					</script>
					<style type="text/css">
						.ui-icon-excel { background-image: url(images/excel.gif) !important; }
						
						.multiselect {
							min-width:15em;
							width:auto;
							height:30em;
							border:solid 1px #c0c0c0;
							overflow-y:auto;
							 overflow-x:hidden;
						}
						 
						.multiselect label {
							display:block;
							 font-family:inherit;
							 font-size:10pt;
							 color:inherit;
						}
						 
						.multiselect-on {
							color:#ffffff !important;
							background-color:#000099;
						}
					</style>
					
					<cfquery name="qryDistributionCenters" datasource="#session.dsn#">
						SELECT DistributionCenterID, DistributionCenter
						FROM mgmt_distributioncenter
						WHERE Active = <cfqueryparam value="1" cfsqltype="cf_sql_tinyint">
						ORDER BY DistributionCenter ASC
					</cfquery>
					
					<div style="line-height:5px;">&nbsp;</div>
                
						
					<table>
						<tr>
							<td valign="top">
								<input type="checkbox" id="cbCheckAllFacility" style="height:12px;" >
								<label for="cbCheckAllFacility">Distribution Center: </label>
								<div id="facility" class="multiselect">
									<cfoutput query="qryDistributionCenters">
										<label><input type="checkbox" name="option[]"  value="#qryDistributionCenters.DistributionCenterID#" <cfif listFind(qryUsers.DistributionCenterAccess,qryDistributionCenters.DistributionCenterID)>checked</cfif> />#qryDistributionCenters.DistributionCenter# </label>
									</cfoutput>
									<input type="hidden" id="distributioncenters" name="distributioncenters" value="">
								</div>
							</td>
							<td valign="top" nowrap>
								<input type="checkbox" id="cbCheckAllLocations" style="height:12px;">
								<label for="cbCheckAllLocations">Location:The Locations should only be chosen to limit the users access to the selected Distribution Centers </label>
								<div id="locations" class="multiselect" >
								</div>
								<input type="hidden" id="loc" name="loc" value="">
								<input type="hidden" id="sellocation" value="<cfoutput>#qryUsers.LocationAccess#</cfoutput>">
							</td>
					 
						</tr>
					</table>

					<tr><td colspan="4">&nbsp;</td></tr>
					<tr>
						<td></td>
						<td align="left">
							
							<input type="submit" id="btnSubmit" name="btnSubmit" value="Save" style="width:100px;"> 	
					
							<span style="float:middle;">
								<input type="button" id="btnCancel" name="btnCancel" value="Cancel" onclick="window.history.back();" style="width:100px;">
							</span>
						</td>
					</tr>
				</table>
				</form>
    <cfelse>
		


        
    <!--- ---------------------------------------------------------------------------------- --->
    <!---                            DEFAULT VIEW - START                                    --->
    <!--- javascript/jquery --->
        <script type="text/javascript">
            $(document).ready(function() {
				$('#addNewUser').button();
				$('#btnEdit').button();
            });
            
        </script>
    
        <cfquery name="qryUsers" datasource="#session.dsn#">
            SELECT UserID, UserName, Admin
            FROM tbl_users 
            ORDER BY UserName ASC
        </cfquery>
        
        <a href="?do=User&sr=0&add" id="addNewUser" class="alink">Add New User</a><br><br>
    
        <cfoutput>
        <table id="usersTable" cellpadding="2" cellspacing="0" border="1" rules="none" frame="void" style="border-color:##DDDDDD">
            <tr valign="top">
                <td align="right">
                    <label for="selUser">Users: </label>
                </td>
                <td>
                    <select id="selUser" name="selUser" size="10" style="min-width:100px;">
                        <cfset showInactive = 0>
                        <cfloop query="qryUsers">
                            <cfif qryUsers.Admin EQ 0 AND showInactive EQ 0>
                            
                                <cfset showInactive = 1>
                            </cfif>
                            <option value="#qryUsers.UserID#">#qryUsers.UserName#</option>
                        </cfloop>
                        
                        <cfif showInactive EQ 1>
                            <!---</optgroup>--->
                        </cfif>
                    </select>
                </td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <!--- ADD IN SECURITY --->
               
                <td align="left">
                    <input type="button" id="btnEdit" name="btnEdit" value="Edit" class="alink" onclick="window.location='?do=User&sr=' + document.getElementById('selUser').value + '&edit'" style="width:100px;">
                </td>
            </tr>
    
        </table>
        </cfoutput>
        
    <!---                             DEFAULT VIEW - END                                     --->
    <!--- ---------------------------------------------------------------------------------- --->
    
    </cfif>			
