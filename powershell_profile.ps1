function Select-Group {
    param(
		[string] $pattern,
        [Parameter(ValueFromPipeline=$true)] $input
    )

	$input | Select-String -Pattern $pattern | % { $_.Matches.Value }
}

function Invoke-WithArgs($cmd) {
	$argString = [system.String]::Join(" ", $args)
    $sb = [scriptblock]::Create("$cmd $argString")
    Invoke-Command $sb
}
