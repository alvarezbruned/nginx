START UPDATING DEFAULT CONF
[ -z "${DOMAIN_PORT_8081_TCP_ADDR}" ] && echo "\$DOMAIN_PORT_8081_TCP_ADDR is not set" || sed -i "s/DOMAIN_IP/${DOMAIN_PORT_8081_TCP_ADDR}/" /etc/nginx/conf.d/default.conf
[ -z "${DOMAIN_PORT_8081_TCP_PORT}" ] && echo "\$DOMAIN_PORT_8081_TCP_PORT is not set" || sed -i "s/DOMAIN_PORT/${DOMAIN_PORT_8081_TCP_PORT}/" /etc/nginx/conf.d/default.conf
echo "CHANGED DEFAULT CONF"
cat /etc/nginx/conf.d/default.conf
echo "END UPDATING DEFAULT CONF"
