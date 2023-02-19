FROM yiisoftware/yii2-php:7.4-apache
COPY db.php.template /db.php.template
COPY default.conf.template /default.conf.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh
CMD ["/entrypoint.sh"]
