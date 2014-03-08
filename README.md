Document-Alerts
===============

Alert system on an instance of document cloud.

TODO list:
==========

* Many to many relation between alerts and users. The idea is to avoid multiple hits to DocumentCloud's API for the same query.
* Cache on searches. Specially on "Mugica", to avoid innecesarly hits into the API. We can refresh the cache every day (for instance).
* Add tests!
* Activate Mandrill to handle emails.
* Install Resque to handle searchess and notifications queues.
* Store searches on database for statistics.
* Since we are not using any kind of transactions or joins in any query. Mongo will provide us a much more easy development. Consider this option.
* Switch to foundation. Looks prettier and we won't have the clasical bootstrap like site.
