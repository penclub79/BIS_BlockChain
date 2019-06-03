<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/">
<xsl:decimal-format name="digit" decimal-separator="." grouping-separator="," infinity="&#x221E;" minus-sign="-" NaN="0" percent="%" per-mille="&#x03BC;" zero-digit="0" digit="#" pattern-separator=";" />
<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes" />
<xsl:template match="/">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title> D190524PCapp_form </title>
	<link rel="shortcut icon" href="http://www.3ksoftware.com/favicon.ico"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/soaxml_webformReset.css" rel="stylesheet"  media="screen"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/uniform.default.css" rel="stylesheet" media="screen" />
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/jquery-ui.1.10.3.smoothness.css" rel="stylesheet" media="screen" />
	<style></style>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxControl.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxCommon.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery-ui.1.10.3.min.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery.uniform.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jSignature.custom.js"></script>
	<script type="text/javascript">
		function basexml_checktype() {
			bxfSetVal_format_number('root/contents/Year_of_graduation','<xsl:value-of select="root/contents/Year_of_graduation"/>');
bxfSetVal_format_number('root/contents/date','<xsl:value-of select="root/contents/date"/>');
bxfSetValComboBox("root/contents/TITLE",'<xsl:value-of select="root/contents/TITLE"/>');
			$("input, textarea, select, button").uniform();
			$("input[type='radio']").each(function(){
				$(this).attr("disabled","true");
			});
			$("input[type='checkbox']").each(function(){
				$(this).attr("disabled","true");
			});
			$("select").each(function(){
				$(this).attr("disabled","true");
			});
		}
	</script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxFormForMongo.js"></script>
</head>
<body onLoad='javascript:basexml_checktype( );'>
<form name="D190524PCapp_form">
<P>
<TABLE style="WIDTH: 700px" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="700">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>
<TABLE id="20190524_173729" style="WIDTH: 95%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 18pt">
<SELECT name="root/contents/TITLE">
<OPTION selected="selected" value="">졸업 증명
</OPTION>
<OPTION value="">재학 증명
</OPTION>
<OPTION value="">성적 증명
</OPTION>
</SELECT>&#160;
<STRONG>신청서
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 30px">
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<P>
<TABLE style="WIDTH: 95%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="18%">
</COL>
<COL width="32%">
</COL>
<COL width="18%">
</COL>
<COL width="32%">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD bgColor="#afeeee" colSpan="4">
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 12pt">신청 내역
</SPAN>
</STRONG>
</P>
</TD>
</TR>
<TR>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>이름*
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/name"/>
</P>
</TD>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>전공학과*
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/major_department"/>
</P>
</TD>
</TR>
<TR>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>졸업(수료)년도
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/Year_of_graduation"/>
</P>
</TD>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>학번*
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/class_of"/>
</P>
</TD>
</TR>
<TR>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>용도*
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/purpose"/>
</P>
</TD>
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>신청일
</STRONG>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/date"/>
</P>
</TD>
</TR>
<TR style="HEIGHT: 60px">
<TD bgColor="#e9e9e9">
<P align="center">
<STRONG>기타사항
</STRONG>
</P>
</TD>
<TD colSpan="3">
<P>
<xsl:apply-templates select="root/contents/Other_matters"/>&#160;
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<TABLE id="20190526_142833" style="WIDTH: 95%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR style="HEIGHT: 30px">
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 11pt">상기 본인은&#160;증명서 발급을 요청 합니다.
</SPAN>
</P>
</TD>
</TR>
<TR style="HEIGHT: 100px">
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<TABLE id="1" style="WIDTH: 40%" borderColor="#e0e0e0" cellSpacing="0" cellPadding="1" align="right" border="1">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P align="center">신청자
</P>
</TD>
</TR>
<TR style="HEIGHT: 205px">
<TD>
<DIV align="center">
<DIV id="div_root_contents_sign" class="signature" style="HEIGHT: 200px; WIDTH: 95%; POSITION: relative">
<DIV align="left">&#160;
</DIV>
</DIV>
</DIV>
<DIV align="center">&#160;
</DIV>
</TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
<TR style="HEIGHT: 30px">
<TD>
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">
</SPAN>
</STRONG>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<STRONG>
<SPAN style="FONT-SIZE: 16pt">3K BICAS 대학교 교무처 귀중
</SPAN>
</STRONG>
</P>
</TD>
</TR>
<TR style="HEIGHT: 30px">
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
</form>
<script language="JavaScript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxXsl.js"></script>
	<div class="docBtn_list">
		<input type="button" value="Update" onclick="javascript:bxfXmlModifyMongodb();" /> &#160;
		<input type="button" value="List" onclick="javascript:bxfXmlListMongodb();" /> &#160;
		<input type="button" value="Search" onclick="javascript:bxfXmlSearchMongodb();" />
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$signImg = $("#div_root_contents_sign");
	sign = new Image();
	sign.src = '<xsl:value-of select="root/contents/sign"/>';
	$(sign).appendTo($signImg);
	});
</script>
</body>
</html>
</xsl:template>
<xsl:template match="BR"><br/></xsl:template>
<xsl:template match="br"><br/></xsl:template>
<xsl:template match="li"><li/></xsl:template>
<xsl:template match="LI"><LI/></xsl:template>
<xsl:template match="A">
<xsl:element name="a">
	<xsl:attribute name="href" ><xsl:value-of select="@href"/></xsl:attribute>
	<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
	<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
	<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="FONT">
<xsl:element name="FONT">
	<xsl:attribute name="color"><xsl:value-of select="@color"/></xsl:attribute>
	<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
	<xsl:attribute name="face"><xsl:value-of select="@face"/></xsl:attribute>
	<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
	<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="IMG">
<xsl:element name="img">
	<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
	<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
	<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
	<xsl:attribute name="hspace"><xsl:value-of select="@hspace"/></xsl:attribute>
	<xsl:attribute name="vspace"><xsl:value-of select="@vspace"/></xsl:attribute>
	<xsl:attribute name="border"><xsl:value-of select="@border"/></xsl:attribute>
	<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="HR"><hr/></xsl:template>
</xsl:stylesheet>
