function Merge-Hashtables {
    $Output = @{}
    ForEach ($Hashtable in ($Input + $Args)) {
        if ($Hashtable -is [Hashtable]){
            ForEach ($Key in $Hashtable.Keys) { $Output.$Key = $Hashtable.$Key }
        }
    }
    $Output
}