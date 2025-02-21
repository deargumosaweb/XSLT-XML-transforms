<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.redbeemedia.com/nucleus/metadata/ns/v1/standard_metadata" xmlns:cn="http://www.redbeemedia.com/nucleus/metadata/ns/v1/content" xmlns:au="http://www.redbeemedia.com/nucleus/metadata/ns/v1/audio_layout" xmlns:sg="http://www.redbeemedia.com/nucleus/metadata/ns/v1/segmentation" xmlns:mk="http://www.redbeemedia.com/nucleus/metadata/ns/v1/markers" xmlns:id="http://www.redbeemedia.com/nucleus/metadata/ns/v1/identification" xmlns:ed="http://www.redbeemedia.com/nucleus/metadata/ns/v1/editorial" xmlns:tn="http://www.redbeemedia.com/nucleus/metadata/ns/v1/technical" xmlns:tc="http://screenstaring.com/xslt/timecode" xmlns:qc="http://www.redbeemedia.com/nucleus/metadata/ns/v1/qc" exclude-result-prefixes="tc" version="1.0">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:comment>Generated from Stratus to Nucleus Standard Transform v0.9 ealedea</xsl:comment>
		<Nucleus xmlns="http://www.redbeemedia.com/nucleus/metadata/ns/v1/standard_metadata" xmlns:cn="http://www.redbeemedia.com/nucleus/metadata/ns/v1/content" xmlns:au="http://www.redbeemedia.com/nucleus/metadata/ns/v1/audio_layout" xmlns:sg="http://www.redbeemedia.com/nucleus/metadata/ns/v1/segmentation" xmlns:mk="http://www.redbeemedia.com/nucleus/metadata/ns/v1/markers" xmlns:id="http://www.redbeemedia.com/nucleus/metadata/ns/v1/identification" xmlns:ed="http://www.redbeemedia.com/nucleus/metadata/ns/v1/editorial" xmlns:tn="http://www.redbeemedia.com/nucleus/metadata/ns/v1/technical" xmlns:qc="http://www.redbeemedia.com/nucleus/metadata/ns/v1/qc">
			<id:Identifiers>
				<xsl:choose>
					<xsl:when test="/Asset/Properties/Properties[@Key='CustomMd_Mat ID']/*/* != ''">
						<id:Material_ID>
							<xsl:value-of select="/Asset/Properties/Properties[@Key='CustomMd_Mat ID']/*/*"/>
						</id:Material_ID>
					</xsl:when>
					<xsl:otherwise>
						<id:Material_ID>
							<xsl:value-of select="/Asset/Properties/Properties[@Key='Name']/*/*"/>
						</id:Material_ID>
					</xsl:otherwise>
				</xsl:choose>
			</id:Identifiers>
			<cn:Content>
				<xsl:choose>
					<xsl:when test="/Asset/Properties/Properties[@Key='CustomMd_Content Type']/*/* != ''">
						<cn:Content_Type>
							<xsl:value-of select="/Asset/Properties/Properties[@Key='CustomMd_Content Type']/*/*"/>
						</cn:Content_Type>
					</xsl:when>
					<xsl:otherwise>
						<cn:Content_Type>Programme</cn:Content_Type>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="/Asset/Properties/Properties[@Key='Description']/*/* != ''">
					<cn:Description>
						<xsl:value-of select="/Asset/Properties/Properties[@Key='Description']/*/*"/>
					</cn:Description>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="/Asset/Properties/Properties[@Key='CustomMd_Original Supplier']/*/* != ''">
						<cn:Supplier>
							<xsl:value-of select="/Asset/Properties/Properties[@Key='CustomMd_Original Supplier']/*/*"/>
						</cn:Supplier>
					</xsl:when>
					<xsl:otherwise>
						<cn:Supplier>RBM - Central Ingest</cn:Supplier>
					</xsl:otherwise>
				</xsl:choose>
				<cn:Origin>Central Ingest</cn:Origin>
			</cn:Content>
			<tn:Technical>
				<tn:Media_File_Name><xsl:value-of select="/Asset/Job/Properties[@Key='Filename']/*/*"/>.mxf</tn:Media_File_Name>
				<tn:Start_Of_File>
					<xsl:value-of select="translate(/Asset/Properties/Properties[@Key='MarkInStr']/*/*, '.',':')"/>
				</tn:Start_Of_File>
				<tn:Video_Format>
					<xsl:value-of select="/Asset/Associations/Association/Properties/Properties[@Key='VideoCompression']/*/*"/>
				</tn:Video_Format>
				<tn:Scan_Type>
					<xsl:variable name="scantype" select="/Asset/Associations/Association/Properties/Properties[@Key='Ext_Interlaced']/*/*"/>
					<xsl:choose>
						<xsl:when test="$scantype = 'true'">Interlaced</xsl:when>
						<xsl:otherwise>Progressive</xsl:otherwise>
					</xsl:choose>
				</tn:Scan_Type>
				<tn:Frame_Rate>
					<xsl:value-of select="/Asset/Associations/Association/Properties/Properties[@Key='Ext_FrameRateRounded']/*/*"/>
				</tn:Frame_Rate>
				<xsl:choose>
					<xsl:when test="/Asset/Associations/Association/Properties/Properties[@Key='AspectRatio']/*/* = 'Widescreen'">
						<tn:Display_Aspect_Ratio>16:9</tn:Display_Aspect_Ratio>
						<tn:Picture_Aspect_Ratio>1.78</tn:Picture_Aspect_Ratio>
					</xsl:when>
					<xsl:otherwise>
						<tn:Display_Aspect_Ratio>4:3</tn:Display_Aspect_Ratio>
						<tn:Picture_Aspect_Ratio>1.33</tn:Picture_Aspect_Ratio>
					</xsl:otherwise>
				</xsl:choose>
				<tn:Audio_Track_Count>
					<xsl:value-of select="count(/Asset/Properties/Properties[@Key='AudioTags']/*/*/AudioTag)"/>
				</tn:Audio_Track_Count>
				<tn:Audio_Channel_Count>
					<xsl:value-of select="count(/Asset/Properties/Properties[@Key='AudioTags']/*/*/AudioTag)"/>
				</tn:Audio_Channel_Count>
				<tn:Audio_Format>
					<xsl:value-of select="/Asset/Associations/Association/Properties/Properties[@Key='AudioFormat']/*/*"/>
				</tn:Audio_Format>
			</tn:Technical>
			<xsl:if test="/Asset/Properties/Properties[@Key='CustomMd_Title']/*/* != ''">
				<ed:Editorial>
					<ed:Title>
						<xsl:value-of select="/Asset/Properties/Properties[@Key='CustomMd_Title']/*/*"/>
					</ed:Title>
				</ed:Editorial>
			</xsl:if>
			<qc:Quality_Control>
				<qc:Manual_QC>
					<xsl:choose>
						<xsl:when test="/Asset/Properties/Properties[@Key='CustomMd_Required QC']/*/* != ''">
							<qc:Manual_QC_Type>
								<xsl:value-of select="translate(/Asset/Properties/Properties[@Key='CustomMd_Required QC']/*/*, ' ', '')"/>
							</qc:Manual_QC_Type>
						</xsl:when>
						<xsl:otherwise>
							<qc:Manual_QC_Type>3PointLowResQC</qc:Manual_QC_Type>
						</xsl:otherwise>
					</xsl:choose>
					<qc:Completion_Status>Required</qc:Completion_Status>
				</qc:Manual_QC>
				<xsl:if test="translate(/Asset/Properties/Properties[@Key='CustomMd_Required QC']/*/*, ' ', '') = 'FullHiResQC'">
					<qc:Auto_QC>
						<qc:AQC_Type>DetailedWithFPA</qc:AQC_Type>
						<qc:Completion_Status>Required</qc:Completion_Status>
					</qc:Auto_QC>
				</xsl:if>
			</qc:Quality_Control>
			<xsl:if test="count(/Asset/Properties/Properties[@Key='AudioTags']/*/*/AudioTag[TrackLabel != ''])">
				<au:Audio_Layout>
					<au:Audio_Channels>
						<xsl:apply-templates select="/Asset/Properties/Properties[@Key='AudioTags']/*/*/AudioTag"/>
					</au:Audio_Channels>
				</au:Audio_Layout>
			</xsl:if>
			<xsl:if test="/Asset/Segmentations != ''">
				<sg:Segmentation>
					<sg:Log_Tracks>
						<sg:Log_Track>
							<sg:Track_Type>PLAYOUT</sg:Track_Type>
							<sg:Log_Items>
								<xsl:apply-templates select="/Asset/Segmentations/Segmentation/Properties/Properties[@Key='Segments']/Value/Segments/Segment"/>
							</sg:Log_Items>
						</sg:Log_Track>
					</sg:Log_Tracks>
				</sg:Segmentation>
			</xsl:if>
		</Nucleus>
	</xsl:template>
	<xsl:template match="AudioTag">
		<xsl:if test="TrackLabel != ''">
			<au:Audio_Channel>
				<au:Audio_Channel_ID>
					<xsl:value-of select="TrackNumber"/>
				</au:Audio_Channel_ID>
				<au:Audio_Channel_Layout>
					<xsl:value-of select="TrackLabel"/>
				</au:Audio_Channel_Layout>
			</au:Audio_Channel>
		</xsl:if>
	</xsl:template>
	<xsl:template match="Segment">
		<sg:Log_Item>
			<sg:Order>
				<xsl:value-of select="position()"/>
			</sg:Order>
			<sg:Item_Type>PART</sg:Item_Type>
			<sg:Mark_In>
				<xsl:choose>
					<!-- If the property exists and contains a value -->
					<xsl:when test="Properties/Properties[@Key='InTc']/*/* != ''">
						<xsl:value-of select="translate(Properties/Properties[@Key='InTc']/*/*, '.', ':')"/>
					</xsl:when>
					<!-- Fallback to default value if the property is missing or empty -->
					<xsl:otherwise>00:00:00:00</xsl:otherwise>
				</xsl:choose>
			</sg:Mark_In>
			<sg:Duration>
				<xsl:choose>
					<!-- Case 1: DurationTc is available (timecode format) -->
					<xsl:when test="Properties/Properties[@Key='DurationTc']/*/* != ''">
						<xsl:value-of select="translate(Properties/Properties[@Key='DurationTc']/*/*, '.',':')"/>
					</xsl:when>
					<!-- Case 2: Duration is available (frame count) -->
					<xsl:when test="Properties/Properties[@Key='Duration']/*/* != ''">
						<xsl:variable name="duration">
							<xsl:value-of select="Properties/Properties[@Key='Duration']/*/*"/>
						</xsl:variable>
						<xsl:call-template name="framesToTime">
							<xsl:with-param name="frames" select="$duration"/>
						</xsl:call-template>
					</xsl:when>
					<!-- Case 3: Calculate duration from In and Out -->
					<xsl:otherwise>
						<xsl:variable name="in">
							<xsl:value-of select="Properties/Properties[@Key='In']/*/*"/>
						</xsl:variable>
						<xsl:variable name="out">
							<xsl:value-of select="Properties/Properties[@Key='Out']/*/*"/>
						</xsl:variable>
						<xsl:variable name="duration" select="$out - $in"/>
						<xsl:call-template name="framesToTime">
							<xsl:with-param name="frames" select="$duration"/>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>
			</sg:Duration>
			<sg:Description>
				<xsl:value-of select="Properties/Properties[@Key='Name']/*/*"/>
			</sg:Description>
		</sg:Log_Item>
	</xsl:template>
	<xsl:template name="framesToTime">
		<xsl:param name="frames"/>
		<!-- Convert total frames (50 fps) to timecode at 25 fps -->
		<xsl:variable name="totalFrames25" select="floor($frames div 2)"/>
		<!-- Compute time components -->
		<xsl:variable name="totalSeconds" select="floor($totalFrames25 div 25)"/>
		<xsl:variable name="framesPart" select="$totalFrames25 mod 25"/>
		<xsl:variable name="seconds" select="$totalSeconds mod 60"/>
		<xsl:variable name="totalMinutes" select="floor($totalSeconds div 60)"/>
		<xsl:variable name="minutes" select="$totalMinutes mod 60"/>
		<xsl:variable name="hours" select="floor($totalMinutes div 60)"/>
		<!-- Output formatted timecode -->
		<xsl:value-of select="format-number($hours, '00')"/>
		<xsl:text>:</xsl:text>
		<xsl:value-of select="format-number($minutes, '00')"/>
		<xsl:text>:</xsl:text>
		<xsl:value-of select="format-number($seconds, '00')"/>
		<xsl:text>:</xsl:text>
		<xsl:value-of select="format-number($framesPart, '00')"/>
	</xsl:template>
</xsl:stylesheet>