:local l [interface pppoe-server server find]
:local total [:len $l]
:local cont 0
:foreach i in=$l do={
    :local NomeServico [/interface pppoe-server server get $i value-name=service]
    :local ClienteServico 0
    :foreach cliente in [/interface pppoe-server find where service=$NomeServico] do={
        :set $ClienteServico ($ClienteServico + 1)
    }
    if ($cont < $total) do={
        :put ("{\"{#SERVICENAME}\":{\"" . $NomeServico . "\":\"" . $ClienteServico . "\"}},")
    }  else={
        :put ("{\"{#SERVICENAME}\":{\"" . $NomeServico . "\":\"" . $ClienteServico . "\"}}")
    }
    :set $cont ($cont + 1);
}
