<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" omit-xml-declaration="yes" indent="yes"/>
	<xsl:strip-space elements="*"/>

	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<xsl:apply-templates select="repository"/>
		</html>
	</xsl:template>

	<xsl:template match="repository">
		<head>
			<title>
				Update site for EMF Teneo and EMFT Texo dependencies
			</title>
		</head>
		<body>
			<h1>
				Update site for EMF Teneo and EMFT Texo dependencies
			</h1>
			<p>For information on EMF Teneo and EMFT Texo visit the following links:
			<ul>
			<li><a href="http://wiki.eclipse.org/Teneo/Hibernate">EMF Teneo Wiki</a></li>
			<li><a href="http://wiki.eclipse.org/Texo">EMFT Texo Wiki</a></li>
			</ul>
			</p>
			<p>
				<em>For information about installing or updating software, see the
					<a
						href="http://help.eclipse.org/galileo/index.jsp?topic=/org.eclipse.platform.doc.user/tasks/tasks-124.htm">
						Eclipse Platform Help</a>.</em>
			</p>
			<table border="0">
				<tr>
					<td colspan="2">
						<hr/>
						<h2>Features</h2>
					</td>
				</tr>
				<xsl:apply-templates select="//provided[@namespace='org.eclipse.update.feature']">
					<xsl:with-param name="type">features</xsl:with-param>
					<xsl:sort select="@name"/>
				</xsl:apply-templates>
				<tr>
					<td colspan="2">
						<hr/>
						<h2>Plugins</h2>
					</td>
				</tr>
				<xsl:apply-templates select="//provided[@namespace='osgi.bundle']">
					<xsl:with-param name="type">plugins</xsl:with-param>
					<xsl:sort select="@name"/>
				</xsl:apply-templates>
			</table>
		</body>
	</xsl:template>

	<xsl:template match="provided">
		<xsl:param name="type" />
		<tr>
			<td>
				<xsl:element name="a">
					<xsl:attribute name="href"><xsl:value-of select="$type"/>/<xsl:value-of select="@name"/>_<xsl:value-of select="@version"/>.jar</xsl:attribute>
					<xsl:value-of select="@name"/>
				</xsl:element>
			</td>
			<td>
				<xsl:value-of select="@version"/>
			</td>
		</tr>
	</xsl:template>

</xsl:stylesheet>