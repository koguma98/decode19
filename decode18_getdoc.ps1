#ダウンロード先を指定してね
$saveDirectory = "c:\decode2019_doc\"

$client = New-Object System.Net.WebClient
$downloadUrl = "https://eventmarketing.blob.core.windows.net/decode2019-after/"

# 存在するセッション(サイトからぶっこ抜いたやつ）
$tracks = (
"AI01","AI02","AI03","AI04","AI05","AI06","AI07","AI08","AI09","AI10","AI41","AI51","AI52","AI53","AI54","AI81","AI82","AI83","AI91","AI92",
"CD01","CD02","CD03","CD04","CD05","CD06","CD07","CD08","CD09","CD10","CD11","CD12","CD13","CD14","CD41","CD42","CD43","CD44","CD51","CD52","CD53","CD61","CD62","CD63","CD64","CD65","CD66","CD67","CD68","CD69","CD70","CD71","CD81","CD82","CD83","CD84","CD91","CD92","CD93",
"CM01","CM02","CM03","CM04","CM05","CM06","CM07","CM08","CM09","CM10","CM11","CM12","CM13","CM14","CM15","CM16","CM51","CM52","CM61","CM62","CM81","CM82","CM83","CM84","CM85","CM86",
"DP01","DP02","DP03","DP04","DP05","DP06","DP07","DP08","DP09","DP10","DP41","DP51","DP52","DP81","DP82",
"DT01","DT02","DT03","DT04","DT05","DT06","DT07","DT08","DT09","DT10","DT41","DT51","DT52","DT53","DT61","DT62","DT63","DT81","DT82","DT91",
"IT01","IT02","IT03","IT04","IT05","IT06","IT07","IT51","IT52","IT53","IT82","IT83",
"KN01",
"MW01","MW02","MW03","MW04","MW51","MW52","MW61","MW62","MW63","MW81","MW82","MW91",
"PR01","PR02","PR03","PR04","PR05","PR06","PR07","PR08","PR09","PR10","PR41","PR51","PR52","PR61","PR81","PR82","PR91","PR92",
"SE01","SE02","SE03","SE04","SE05","SE06","SE07","SE51","SE81","SE82","SE91",
"SP01","SP02","SP03","SP04","SP05","SP06","SP07","SP08","SP09","SP11","SP12","SP81","SP82","SP83"
)

#資料の拡張子
$exts = (".pptx", ".pdf")

[System.Console]::WriteLine("▼START")

foreach ($track in $tracks) 
{
    $compCount = 0
    foreach ($ext in $exts) 
    {
        $pref = ""
        if($ext -eq ".pptx")
        {
            $pref = "PPT"
        }
        else
        {
            $pref = "PDF"
        }
# decode19_PPT_CD06.pptx
# decode19_PDF_CD06.pdf
        $fileName = [string]::Format("decode19_{0}_{1}{2}", $pref, $track, $ext)

        try 
        {
            $client.DownloadFile([System.IO.Path]::Combine($downloadUrl, $fileName), [System.IO.Path]::Combine($saveDirectory, $fileName))
            $compCount++
            [System.Console]::WriteLine("○: " + $fileName)
            break
        }
        catch
        {
        }
    }
    if($compCount -eq 0)
    {
        [System.Console]::WriteLine("×: " + $track)
    }
}
[System.Console]::WriteLine("▲END")
