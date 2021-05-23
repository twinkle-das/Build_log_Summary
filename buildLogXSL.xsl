<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:template match="root">
		<html>
			<head>
				<meta charset="UTF-8"></meta>
				<style type="text/css">
					table.report_main {
						border-collapse: collapse;
						border: 1px solid #5082ba;
						width: 100%;
					}
					table.report_main tr th {
						font-weight: bold;
						background:#5082ba;
						color:#ffffff;
						font-size:14px;
						border: 1px solid;
					}
					 table.report_main tr td {
						color:#000000;
						border: 1px solid black;
						font-size:12px;
						border-collapse:collapse;
						word-wrap:break-word;
					}
					th,td {
						text-align: left;
						padding: 8px;
					}
					.a td {
						background: #d1d7e6;
					}
					.b td {
						background: #e9ebf2;
					}
						
				</style>
			</head>
			<body style="font-family:Arial">
				<h4><b>Summary:</b></h4>
					<table class="report_main" style="table-layout:fixed;border: 1px solid;">
						<tr>
							<th width="25%">Property</th>
							<th width="35%">Value</th>
							<th width="40%">Reference Links</th>
						</tr>
						<tr class="a">
							<td>Build ID</td>
							<td>
								<xsl:value-of select="Build_ID"/>- <xsl:value-of select="Build_Type"/>
							</td>
							<td></td>

						</tr>
						<tr class="b">
							<td>Job URL</td>
							<td>
								<a href="{Job_URL}"><xsl:value-of select="Job_URL"/></a>
							</td>
							<td></td>
						</tr>
						<tr class="a">
							<td>Build Trigger Time</td>
							<td>
								<xsl:value-of select="Build_Trigger_Time"/>
							</td>
							<td></td>
						</tr>
						<tr class="b">
							<td>Stream Name</td>
							<td>
								<xsl:value-of select="Stream_Name"/>
							</td>
							<td></td>
						</tr>
						<tr class="a">
							<td>Artifactory Path</td>
							<td>
								<a href="{Artifactory_Path}"><xsl:value-of select="Artifactory_Path"/></a>
							</td>
							<td></td>
						</tr>
						<tr class="b">
							<td>Quality Analysis</td>
							<td>
								<xsl:if test="Quality_analysis='Successful'">
									<b>Successful</b>
								</xsl:if>
								<xsl:if test="Quality_analysis='Failure'">
									<b style='color: red;'>Failure</b>
								</xsl:if>
							</td>
							<td>
							 	<a href="{Quality_analysis_URL}">
									<xsl:value-of select="Summary_report_url"/>
								</a>
								<br/>
							</td>
						</tr>
						<tr class="a">
							<td>LDRA Report</td>
							<td>
								<a href="{LDRA_report}"><xsl:value-of select="LDRA_report"/></a>
							</td>
							<td></td>
						</tr>
						<tr class="b">
							<td>FBDD Report</td>
							<td>
								<xsl:if test="not(FBDD_Status)">
									<b style='color: red;'>Aborted</b>
								</xsl:if>
								<xsl:if test="FBDD_Status='Successful'">
									<b>Successful</b>
								</xsl:if>
								<xsl:if test="FBDD_Status='Failure'">
									<b style='color: red;'>Failure</b>
								</xsl:if>
							</td>
							<td>
								<xsl:if test="FBDD_Status='Failure'">
								<a href="{FBDD_report}">
									<xsl:value-of select="FBDD_report"/>
								</a>
								</xsl:if>
							</td>
						</tr>
						<tr class="a">
							<td>Memory Report</td>
							<td>
								<xsl:if test="not(Memory_Report_Status)">
									<b style='color: red;'>Aborted</b>
								</xsl:if>
								<xsl:if test="Memory_Report_Status">
									<xsl:if test="Memory_Report_Status='Successful'">
										<b>Successful</b>
									</xsl:if>
									<xsl:if test="Memory_Report_Status='Failure'">
										<b style='color: red;'>Failure</b>
									</xsl:if>
									<xsl:if test="Memory_Report_Status='Aborted'">
										<b style='color: red;'>Aborted</b>
									</xsl:if>
								</xsl:if>
							</td>
							<td>
								<a href="{Memory_report_url}">
									<xsl:value-of select="Memory_report_url"/>
								</a>
							</td>
						</tr>
						<tr class="b">
							<td>Compilation</td>
							<td>
								<xsl:if test="not(Compilation)">
									<b style='color: red;'>Aborted</b>
								</xsl:if>
								<xsl:if test="Compilation">
									<xsl:if test="Compilation='Successful'">
										<b>Successful</b>
									</xsl:if>
									<xsl:if test="Compilation='Failure'">
										<b style='color: red;'>Failure</b>
									</xsl:if>
								</xsl:if>
							</td>
							<td style="line-height:1.5"><b>Successful Controllers: <br/></b>
								<xsl:value-of select="Successful_Controllers"/><br/>
								<b>Failed Controller:<br/></b>
								<b style='color: red;'><xsl:value-of select="Failed_Controller"/><br/></b>
								<b>Compilation URL:<br/></b>
								<a href="{Compilation_URL}"><xsl:value-of select="Compilation_URL"/></a>
							</td>
						</tr>
						<!-- <tr>
							<td>PMBD Architecture Validation</td>
							<td><xsl:value-of select="PMBD_Architecture_Validation"/></td>
						</tr> -->
					</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>