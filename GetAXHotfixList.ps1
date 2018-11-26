	$packageDirectory = "C:\AOSService\PackagesLocalDirectory";
	foreach($file in Get-ChildItem $packageDirectory)
	{
	    $folderPath = $packageDirectory + "\" + $file;
	    foreach($file in Get-ChildItem $folderPath)
	    {    
	        $subFolder1 = $folderPath + "\" + $file;
	        if ( Test-Path $subFolder1 -PathType Container )
	        {    
	            foreach($file in Get-ChildItem $subFolder1)
		        {
	                $subFolder2 = $file;
			        $subFolder2Path = $subFolder1 + "\" + $file;
	                if($subFolder2 -like "AXUpdate")
	                {
			            $booleanOutputFolder = $true;
	                    foreach($file in Get-ChildItem $subFolder2Path\*.XML)
			            {
	                        if($booleanOutputFolder -eq $true)
	                        {
	                            $booleanOutputFolder = $false;
	                            Write-Host "Fixes for folder:"$subFolder1;
	                        }
	                        $xml = [xml](Get-Content $file);
	                        Write-Host "Found KB:"$xml.AxUpdate.KBNumbers.string "     Package #:" $xml.AxUpdate.Name;
	                     }
	                    if($booleanOutputFolder -eq $false)
	                    {
	                        Write-Host "";
	                    }
	                }
		        }
	        }
	    }
	}
