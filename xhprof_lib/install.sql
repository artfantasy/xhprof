DROP TABLE IF EXISTS `details`;
CREATE TABLE `details` (
  `id` char(17) NOT NULL,
  `url` varchar(255) default NULL,
  `c_url` varchar(255) default NULL,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `server name` varchar(64) default NULL,
  `perfdata` MEDIUMBLOB,
  `type` tinyint(4) default NULL,
  `cookie` BLOB,
  `post` BLOB,
  `get` BLOB,
  `pmu` int(11) unsigned default NULL,
  `wt` int(11) unsigned default NULL,
  `cpu` int(11) unsigned default NULL,
  `server_id` char(3) NOT NULL default 't11',
  `aggregateCalls_include` varchar(255) DEFAULT NULL,
  PRIMARY KEY  (`id`),
  KEY `url` (`url`),
  KEY `c_url` (`c_url`),
  KEY `cpu` (`cpu`),
  KEY `wt` (`wt`),
  KEY `pmu` (`pmu`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





/*********** xhprof crontab start  **************
	
DROP EVENT IF EXISTS `XHPROF_CRONTAB`;
CREATE EVENT `XHPROF_CRONTAB` ON SCHEDULE
EVERY 1 HOUR
ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Auto Clear Table Data' DO
DELETE FROM `details` WHERE timestamp < (CURRENT_TIMESTAMP() - 3600);

/*********** xhprof crontab end  ****************