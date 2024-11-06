<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <!-- 用于格式化数字的模板 -->
    <xsl:template name="format-number">
        <xsl:param name="value"/>
        <xsl:value-of select="format-number($value, '##0.00')"/>
    </xsl:template>

    <xsl:template match="/products">
        <html>
            <head>
                <title>Product List</title>
            </head>
            <body>
                <h2>Product List</h2>
                <table border="1">
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total Price</th>
                    </tr>
                    <xsl:for-each select="product">
                        <tr>
                            <td><xsl:value-of select="name"/></td>
                            <td>
                                <xsl:call-template name="format-number">
                                    <xsl:with-param name="value" select="price"/>
                                </xsl:call-template>
                            </td>
                            <td><xsl:value-of select="quantity"/></td>
                            <td>
                                <xsl:call-template name="format-number">
                                    <xsl:with-param name="value" select="number(price) * number(quantity)"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
