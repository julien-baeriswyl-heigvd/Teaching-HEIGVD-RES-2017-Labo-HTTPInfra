<?php
    $host_dynamic = getenv('DYNAMIC_APP');
    $host_static  = getenv('STATIC_APP');
?>
<VirtualHost *:80>
    ServerName demo.res.ch

    #ErrorLog ${APACHE_LOG_DIR}/error.log
    #CustomLog ${APACHE_LOG_DIR}/access.log combined
    
    <Proxy "balancer://staticapp">
        BalancerMember "http://<?php print "$host_static";?>"
    </Proxy>
    
    <Proxy "balancer://dynamicapp">
        BalancerMember "http://<?php print "$host_dynamic";?>"
    </Proxy>

    ProxyPass        "/api/" "balancer://dynamicapp/api/"
    ProxyPassReverse "/api/" "balancer://dynamicapp/api/"

    ProxyPass        "/" "balancer://staticapp/"
    ProxyPassReverse "/" "balancer://staticapp/"
</VirtualHost>
