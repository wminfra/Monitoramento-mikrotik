:global lista [/routing/bgp/session find];
:global contador 0;
:global total [:len $lista];
:global i 0;
:put "{\"data\":[";
:foreach i in=$lista do={
    :set $contador ($contador + 1);
    :global nome [/routing/bgp/session get value-name=name number=$i];
    :global as [/routing/bgp/session get value-name=remote.as number=$i];
    #:global disa [/routing/bgp/connection/ get value-name=disabled [find where name="$nome"]];
    :global estabel [/routing/bgp/session/get value-name=established number=$i];
    :global uptime [/routing/bgp/session/get value-name=uptime number=$i];
    :global prefix [/routing/bgp/session/get value-name=prefix-count number=$i];
    :if ($contador < $total) do={
        :put "{\
            \"{#PEERNAME}\":\"$nome\",\
            \"{#REMOTEAS}\":\"$as\",\
            \"{#ESTABEL}\":\"$estabel\",\
            \"{#UPTIME}\":\"$uptime\",\
            \"{#PREFIX}\":\"$prefix\"\
            },"
    } else={
        :put "{\
            \"{#PEERNAME}\":\"$nome\",\
            \"{#REMOTEAS}\":\"$as\",\
            \"{#ESTABEL}\":\"$estabel\",\
            \"{#UPTIME}\":\"$uptime\",\
            \"{#PREFIX}\":\"$prefix\"\
            }"
    }
}
:put "]}";