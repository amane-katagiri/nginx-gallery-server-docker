<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes" />
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title><xsl:value-of select="$title" /></title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <style>
                    div.list {
                        display: grid;
                        grid-template-rows: repeat(auto-fill, calc(50vw - 20px));
                        grid-template-columns: repeat(auto-fill, calc(50vw - 20px));
                        grid-auto-flow: row;
                        justify-content: center;
                        margin: 1em 0;
                    }
                    div.item {
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        width: calc(50vw - 20px);
                        height: calc(50vw - 20px);
                        border-radius: calc((50vw - 20px) / 2);
                        box-sizing: border-box;
                        background-color: #e5e5e5;
                    }
                    div.directory a {
                        width: calc((50vw - 20px) * 0.7);
                        height: calc((50vw - 20px) * 0.7);
                        display: flex;
                        align-items: center;
                        justify-content: center;
                    }
                    div.directory a span {
                        word-break: break-word;
                    }
                    div.file a {
                        max-width: calc(50vw - 20px);
                        max-height: calc(50vw - 20px);
                    }
                    div.file img {
                        max-width: calc(50vw - 20px);
                        max-height: calc(50vw - 20px);
                    }
                    body {
                        margin: 0;
                    }
                </style>
            </head>
            <body>
                <div class="list">
                    <div class="directory item">
                        <div class="directory item">
                            <a href=".."><span>..</span></a>
                        </div>
                    </div>
                    <xsl:for-each select="list/directory">
                        <div class="directory item">
                            <a href="{.}"><span><xsl:value-of select="." /></span></a>
                        </div>
                    </xsl:for-each>
                    <xsl:for-each select="list/file">
                        <div class="file item">
                            <a href="{.}" target="_blank" rel="noopener noreferrer"><img src="{.}" alt="{.}"/></a>
                        </div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
