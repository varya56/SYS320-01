﻿$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.14/ToBeScraped.html
$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select-Object outerText
$h2s