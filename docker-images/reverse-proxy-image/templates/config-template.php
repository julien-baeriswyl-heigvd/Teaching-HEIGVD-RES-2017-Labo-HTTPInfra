<?php
    $host_dynamic = getenv('DYNAMIC_APP');
    $host_static  = getenv('STATIC_APP');
?>
<VirtualHost *:80>
    ServerName demo.res.ch

    ProxyPass        '/api/' 'http://<?php print "$host_dynamic";?>/api/'
    ProxyPassReverse '/api/' 'http://<?php print "$host_dynamic";?>/api/'

    ProxyPass        '/' 'http://<?php print "$host_static";?>/'
    ProxyPassReverse '/' 'http://<?php print "$host_static";?>/'
</VirtualHost>
