"use strict"

{EventEmitter} = require 'events'
xmlrpc = require 'xmlrpc'

class Client extends EventEmitter
	constructor: (@apikey, isOTE, cb) ->
		if isOTE == true
			options = {
				host: 'rpc.ote.gandi.net',
				port: 443,
				path: '/xmlrpc/'
			}
		else
			options = {
				host: 'rpc.gandi.net',
				port: 443,
				path: '/xmlrpc/'
			}

		@api = xmlrpc.createSecureClient options
		cb(@)
	
	version_info: (cb) ->
		@api.methodCall 'version.info', [@apikey], cb

	## Domain API ##
	# TODO opts
	domain_available: (domains, cb) ->
		@api.methodCall 'domain.available', [@apikey, domains], cb

	# TODO opts
	domain_count: (cb) ->
		@api.methodCall 'domain.count', [@apikey], cb

	domain_create: (domain, params, cb) ->
		@api.methodCall 'domain.create', [@apikey, domain, params], cb

	domain_info: (domain, cb) ->
		@api.methodCall 'domain.info', [@apikey, domain], cb

	# TODO opts
	domain_list: (cb) ->
		@api.methodCall 'domain.list', [@apikey], cb

	domain_renew: (domain, params, cb) ->
		@api.methodCall 'domain.renew', [@apikey, domain, params], cb

	domain_restore: (domain, params, cb) ->
		@api.methodCall 'domain.restore', [@apikey, domain, params], cb

	domain_owner_set: (domain, params, cb) ->
		@api.methodCall 'domain.owner.set', [@apikey, domain, params], cb

	domain_owner_set_dry_run: (domain, params, cb) ->
		@api.methodCall 'domain.owner.set_dry_run', [@apikey, domain, params], cb

	domain_contacts_set: (domain, contacts, cb) ->
		@api.methodCall 'domain.contacts.set', [@apikey, domain, contacts], cb

	# TODO opts
	domain_webredir_count: (domain, cb) ->
		@api.methodCall 'domain.webredir.count', [@apikey, domain], cb

	domain_webredir_create: (domain, params, cb) ->
		@api.methodCall 'domain.webredir.create', [@apikey, domain, params], cb

	domain_webredir_delete: (domain, host, cb) ->
		@api.methodCall 'domain.webredir.delete', [@apikey, domain, host], cb

	#TODO opts
	domain_webredir_list: (domain, cb) ->
		@api.methodCall 'domain.webredir.list', [@apikey, domain], cb

	domain_webredir_update: (domain, host, params, cb) ->
		@api.methodCall 'domain.webredir.update', [@apikey, domain, host, params], cb

	domain_status_lock: (domain, cb) ->
		@api.methodCall 'domain.status.lock', [@apikey, domain], cb

	domain_status_unlock: (domain, cb) ->
		@api.methodCall 'domain.status.unlock', [@apikey, domain], cb

	# TODO opts
	domain_host_count: (domain, cb) ->
		@api.methodCall 'domain.host.count', [@apikey, domain], cb

	domain_host_create: (domain, fqdn, ips, cb) ->
		@api.methodCall 'domain.host.create', [@apikey, fqdn, ips], cb

	domain_host_delete: (fqdn, cb) ->
		@api.methodCall 'domain.host.delete', [@apikey, fqdn], cb

	domain_host_info: (fqdn, cb) ->
		@api.methodCall 'domain.host.info', [@apikey, fqdn], cb

	# TODO opts
	domain_host_list: (domain, cb) ->
		@api.methodCall 'domain.host.list', [@apikey, domain], cb

	domain_host_update: (fqdn, ips, cb) ->
		@api.methodCall 'domain.host.update', [@apikey, fqdn, ips], cb

	# TODO opts
	domain_mailbox_count: (domain, cb) ->
		@api.methodCall 'domain.mailbox.count', [@apikey, domain], cb

	domain_mailbox_create: (domain, login, params, cb) ->
		@api.methodCall 'domain.mailbox.create', [@apikey, domain, login, params], cb

	domain_mailbox_info: (domain, login, cb) ->
		@api.methodCall 'domain.mailbox.info', [@apikey, domain, login], cb

	# TODO opts
	domain_mailbox_list: (domain, cb) ->
		@api.methodCall 'domain.mailbox.list', [@apikey, domain], cb

	domain_mailbox_purge: (domain, login, cb) ->
		@api.methodCall 'domain.mailbox.purge', [@apikey, domain, login], cb

	domain_mailbox_update: (domain, login, params, cb) ->
		@api.methodCall 'domain.mailbox.update', [@apikey, domain, login, params], cb

	domain_mailbox_alias_set: (domain, login, aliases, cb) ->
		@api.methodCall 'domain.mailbox.alias.set', [@apikey, domain, login, aliases], cb

	domain_mailbox_responder_activate: (domain, login, params, cb) ->
		@api.methodCall 'domain.mailbox.responder.activate', [@apikey, domain, login, params], cb

	# TODO params
	domain_mailbox_responder_deactivate: (domain, login, cb) ->
		@api.methodCall 'domain.mailbox.responder.deactivate', [@apikey, domain, login], cb

	# TODO opts
	domain_forward_count: (domain, cb) ->
		@api.methodCall 'domain.forward.count', [@apikey, domain], cb

	domain_forward_create: (domain, source, params, cb) ->
		@api.methodCall 'domain.forward.create', [@apikey, domain, source, params], cb

	domain_forward_delete: (domain, source, cb) ->
		@api.methodCall 'domain.forward.delete', [@apikey, domain, source], cb

	# TODO opts
	domain_forward_list: (domain, cb) ->
		@api.methodCall 'domain.forward.list', [@apikey, domain], cb

	domain_forward_update: (domain, source, params, cb) ->
		@api.methodCall 'domain.forward.update', [@apikey, domain, source, params], cb

	domain_packmail_autorenew: (gmail, params, cb) ->
		@api.methodCall 'domain.packmail.autorenew', [@apikey, gmail, params], cb

	domain_packmail_create: (gmail, cb) ->
		@api.methodCall 'domain.packmail.create', [@apikey, gmail, params], cb

	domain_packmail_delete: (gmail, cb) ->
		@api.methodCall 'domain.packmail.delete', [@apikey, gmail], cb

	domain_packmail_info: (gmail, cb) ->
		@api.methodCall 'domain.packmail.info', [@apikey, gmail], cb

	domain_packmail_renew: (gmail, params, cb) ->
		@api.methodCall 'domain.packmail.renew', [@apikey, gmail, params], cb

	domain_packmail_update: (gmail, params, cb) ->
		@api.methodCall 'domain.packmail.update', [@apikey, gmail, params], cb

	# TODO opts
	domain_tld_list: (cb) ->
		@api.methodCall 'domain.tld.list', [@apikey], cb

	# TODO opts
	domain_tld_region: (cb) ->
		@api.methodCall 'domain.tld_region', [@apikey], cb

	# TODO authinfo
	domain_transferin_available: (fqdn, cb) ->
		@api.methodCall 'domain.transferin.available', [@apikey, fqdn], cb

	domain_transferin_proceed: (domain, params, cb) ->
		@api.methodCall 'domain.transferin.proceed', [@apikey, domain, params], cb

	domain_nameservers_set: (domain, nameservers, cb) ->
		@api.methodCall 'domain.nameservers.set', [@apikey, domain, nameservers], cb

	# TODO version_id, params
	domain_zone_clone: (zone_id, cb) ->
		@api.methodCall 'domain.zone.clone', [@apikey, zone_id], cb

	# TODO params
	domain_zone_count: (cb) ->
		@api.methodCall 'domain.zone.count', [@apikey], cb

	domain_zone_create: (cb) ->
		@api.methodCall 'domain.zone.create', [@apikey, params], cb

	domain_zone_delete: (zone_id, cb) ->
		@api.methodCall 'domain.zone.delete', [@apikey, zone_id], cb

	domain_zone_info: (zone_id, cb) ->
		@api.methodCall 'domain.zone.info', [@apikey, zone_id], cb

	# TODO params
	domain_zone_list: (cb) ->
		@api.methodCall 'domain.zone.list', [@apikey], cb

	domain_zone_set: (domain, zone_id, cb) ->
		@api.methodCall 'domain.zone.set', [@apikey, domain, zone_id], cb

	domain_zone_update: (zone_id, params, cb) ->
		@api.methodCall 'domain.zone.update', [@apikey, zone_id, params], cb

	domain_zone_version_count: (zone_id, cb) ->
		@api.methodCall 'domain.zone.version.count', [@apikey, zone_id], cb

	domain_zone_version_delete: (zone_id, version_id, cb) ->
		@api.methodCall 'domain.zone.version.delete', [@apikey, zone_id, version_id], cb

	# TODO version_id
	domain_zone_version_list: (zone_id, cb) ->
		@api.methodCall 'domain.zone.version.list', [@apikey, zone_id], cb

	# TODO version_id
	domain_zone_version_new: (zone_id, cb) ->
		@api.methodCall 'domain.zone.version.new', [@apikey, zone_id], cb

	domain_zone_version_set: (zone_id, version_id, cb) ->
		@api.methodCall 'domain.zone.version.set', [@apikey, zone_id, version_id], cb

	domain_zone_version_add: (zone_id, version_id, params, cb) ->
		@api.methodCall 'domain.zone.version.add', [@apikey, zone_id, version_id, params], cb

	# TODO opts
	domain_zone_record_count: (zone_id, version_id, cb) ->
		@api.methodCall 'domain.zone.record.count', [@apikey, zone_id, version_id], cb

	# TODO opts
	domain_zone_record_delete: (zone_id, version_id, cb) ->
		@api.methodCall 'domain.zone.record.delete', [@apikey, zone_id, version_id], cb

	# TODO opts
	domain_zone_record_list: (zone_id, version_id, cb) ->
		@api.methodCall 'domain.zone.record.list', [@apikey, zone_id, version_id], cb

	domain_zone_record_set: (zone_id, version_id, params, cb) ->
		@api.methodCall 'domain.zone.record.set', [@apikey, zone_id, version_id, params], cb

	domain_zone_record_update: (zone_id, version_id, opts, params, cb) ->
		@api.methodCall 'domain.zone.record.update', [@apikey, zone_id, version_id, opts, params], cb

	domain_dnssec_create: (domain, params, cb) ->
		@api.methodCall 'domain.dnssec.create', [@apikey, domain, params], cb

	domain_dnssec_delete: (key_id, cb) ->
		@api.methodCall 'domain.dnssec.delete', [@apikey, key_id], cb

	domain_dnssec_list: (domain, cb) ->
		@api.methodCall 'domain.dnssec.list', [@apikey, domain], cb

	domain_reseller_set: (domain, cb) ->
		@api.methodCall 'domain.reseller.set', [@apikey, domain], cb

	## Domain API ##
	contact_balance: (cb) ->
		@api.methodCall 'contact.balance', [@apikey], cb

	contact_can_associate: (contact, params, cb) ->
		@api.methodCall 'contact.can_associate', [@apikey, contact, params], cb

	contact_can_associate_domain: (handle, params, cb) ->
		@api.methodCall 'contact.can_associate_domain', [@apikey, handle, params], cb

	contact_create: (params, cb) ->
		@api.methodCall 'contact.create', [@apikey, params], cb

	# TODO handle
	contact_delete: (cb) ->
		@api.methodCall 'contact.delete', [@apikey], cb

	# TODO handle
	contact_info: (cb) ->
		@api.methodCall 'contact.info', [@apikey], cb

	# TODO opts
	contact_list: (cb) ->
		@api.methodCall 'contact.list', [@apikey], cb

	contact_update: (handle, params, cb) ->
		@api.methodCall 'contact.update', [@apikey, handle, params], cb

	## PaaS API ##
	# TODO opts
	paas_count: (cb) ->
		@api.methodCall 'paas.count', [@apikey], cb

	paas_create: (params, cb) ->
		@api.methodCall 'paas.create', [@apikey, params], cb

	paas_delete: (paas_id, cb) ->
		@api.methodCall 'paas.delete', [@apikey, paas_id], cb

	paas_info: (paas_id, cb) ->
		@api.methodCall 'paas.info', [@apikey, paas_id], cb

	# TODO opts
	paas_list: (cb) ->
		@api.methodCall 'paas.list', [@apikey], cb

	paas_renew: (paas_id, params, cb) ->
		@api.methodCall 'paas.renew', [@apikey, paas_id, params], cb

	paas_restart: (paas_id, cb) ->
		@api.methodCall 'paas.restart', [@apikey, paas_id], cb

	paas_update: (paas_id, params, cb) ->
		@api.methodCall 'paas.update', [@apikey, paas_id, params], cb

	# TODO opts
	paas_vhost_count: (cb) ->
		@api.methodCall 'paas.vhost.count', [@apikey], cb

	paas_vhost_create: (params, cb) ->
		@api.methodCall 'paas.vhost.create', [@apikey, params], cb

	paas_vhost_delete: (vhost, cb) ->
		@api.methodCall 'paas.vhost.delete', [@apikey, vhost], cb

	paas_vhost_info: (vhost, cb) ->
		@api.methodCall 'paas.vhost.info', [@apikey, vhost], cb

	# TODO opts
	paas_vhost_list: (cb) ->
		@api.methodCall 'paas.vhost.list', [@apikey], cb

	# TODO opts
	paas_snapshot_count: (cb) ->
		@api.methodCall 'paas.snapshot.count', [@apikey], cb

	paas_snapshot_info: (snapshot, cb) ->
		@api.methodCall 'paas.snapshot.info', [@apikey, snapshot], cb

	# TODO opts
	paas_snapshot_list: (cb) ->
		@api.methodCall 'paas.snapshot.list', [@apikey], cb

	## Hosting API ##
	### Product API ###
	hosting_product_create: (product, cb) ->
		@api.methodCall 'hosting.product.create', [@apikey, product], cb

	hosting_product_delete: (product_id, cb) ->
		@api.methodCall 'hosting.product.delete', [@apikey, product_id], cb

	hosting_product_renew: (product_id, product, cb) ->
		@api.methodCall 'hosting.product.renew', [@apikey, product_id, product], cb

	hosting_product_update: (product_id, product, cb) ->
		@api.methodCall 'hosting.product.update', [@apikey, product_id, product], cb

	### Datacenter API ###
	# TODO opts
	hosting_datacenter_list: (cb) ->
		@api.methodCall 'hosting.datacenter.list', [@apikey], cb

	### Disk Image API ###
	hosting_image_info: (image_id, cb) ->
		@api.methodCall 'hosting.image.info', [@apikey, image_id], cb

	# TODO opts
	hosting_image_list: (cb) ->
		@api.methodCall 'hosting.image.list', [@apikey], cb

	### Disk API ###
	# TODO opts
	hosting_disk_count: (cb) ->
		@api.methodCall 'hosting.disk.count', [@apikey], cb

	hosting_disk_create: (disk_spec, cb) ->
		@api.methodCall 'hosting.disk.create', [@apikey, disk_spec], cb

	hosting_disk_create_from: (disk_spec, src_disk_id, cb) ->
		@api.methodCall 'hosting.disk.create_from', [@apikey, disk_spec, src_disk_id], cb

	hosting_disk_delete: (disk_id, cb) ->
		@api.methodCall 'hosting.disk.delete', [@apikey, disk_id], cb

	hosting_disk_info: (disk_id, cb) ->
		@api.methodCall 'hosting.disk.info', [@apikey, disk_id], cb

	# TODO opts
	hosting_disk_list: (cb) ->
		@api.methodCall 'hosting.disk.list', [@apikey], cb

	hosting_disk_list_kernels: (datacenter_id, cb) ->
		@api.methodCall 'hosting.disk.list_kernels', [@apikey, datacenter_id], cb

	hosting_disk_list_options: (kernel_version, cb) ->
		@api.methodCall 'hosting.disk.list_options', [@apikey, kernel_version], cb

	hosting_disk_rollback_from: (snapshot_id, cb) ->
		@api.methodCall 'hosting.disk.rollback_from', [@apikey, snapshot_id], cb

	hosting_disk_update: (disk_id, disk_spec, cb) ->
		@api.methodCall 'hosting.disk.update', [@apikey, disk_id, disk_spec], cb

	### Network Interface API ###
	# TODO opts
	hosting_iface_count: (cb) ->
		@api.methodCall 'hosting.iface.count', [@apikey], cb

	hosting_iface_create: (iface_spec, cb) ->
		@api.methodCall 'hosting.iface.create', [@apikey, iface_spec], cb

	hosting_iface_delete: (iface_id, cb) ->
		@api.methodCall 'hosting.iface.delete', [@apikey, iface_id], cb

	hosting_iface_info: (iface_id, cb) ->
		@api.methodCall 'hosting.iface.info', [@apikey, iface_id], cb

	# TODO opts
	hosting_iface_list: (cb) ->
		@api.methodCall 'hosting.iface.list', [@apikey], cb

	hosting_iface_update: (iface_id, iface_spec, cb) ->
		@api.methodCall 'hosting.iface.update', [@apikey, iface_id, iface_spec], cb

	### IP Address API ###
	# TODO opts
	hosting_ip_count: (cb) ->
		@api.methodCall 'hosting.ip.count', [@apikey], cb

	hosting_ip_info: (ip_id, cb) ->
		@api.methodCall 'hosting.ip.info', [@apikey, ip_id], cb

	# TODO opts
	hosting_ip_list: (cb) ->
		@api.methodCall 'hosting.ip.list', [@apikey], cb

	hosting_ip_update: (ip_id, ip_spec, cb) ->
		@api.methodCall 'hosting.ip.update', [@apikey, ip_id, ip_spec], cb

	### Virtual Machine API ###
	# TODO opts
	hosting_vm_count: (cb) ->
		@api.methodCall 'hosting.vm.count', [@apikey], cb

	hosting_vm_create: (vm_spec, cb) ->
		@api.methodCall 'hosting.vm.create', [@apikey, vm_spec], cb

	hosting_vm_create_from: (vm_spec, disk_spec, src_disk_id, cb) ->
		@api.methodCall 'hosting.vm.create_from', [@apikey, vm_spec, disk_spec, src_disk_id], cb

	hosting_vm_delete: (vm_id, cb) ->
		@api.methodCall 'hosting.vm.delete', [@apikey, vm_id], cb

	# TODO opts
	hosting_vm_disk_attach: (vm_id, disk_id, cb) ->
		@api.methodCall 'hosting.vm.disk_attach', [@apikey, vm_id, disk_id], cb

	hosting_vm_disk_detach: (vm_id, disk_id, cb) ->
		@api.methodCall 'hosting.vm.disk_detach', [@apikey, vm_id, disk_id], cb

	hosting_vm_disk_rollback: (snapshot_id, cb) ->
		@api.methodCall 'hosting.vm.disk_rollback', [@apikey, snapshot_id], cb

	hosting_vm_iface_attach: (vm_id, iface_id, cb) ->
		@api.methodCall 'hosting.vm.iface_attach', [@apikey, vm_id, iface_id], cb

	hosting_vm_iface_detach: (vm_id, iface_id, cb) ->
		@api.methodCall 'hosting.vm.iface_detach', [@apikey, vm_id, iface_id], cb

	hosting_vm_info: (vm_id, cb) ->
		@api.methodCall 'hosting.vm.info', [@apikey, vm_id], cb

	# TODO opts
	hosting_vm_list: (cb) ->
		@api.methodCall 'hosting.vm.list', [@apikey], cb

	hosting_vm_reboot: (vm_id, cb) ->
		@api.methodCall 'hosting.vm.reboot', [@apikey, vm_id], cb

	hosting_vm_start: (vm_id, cb) ->
		@api.methodCall 'hosting.vm.start', [@apikey, vm_id], cb

	hosting_vm_stop: (vm_id, cb) ->
		@api.methodCall 'hosting.vm.stop', [@apikey, vm_id], cb

	hosting_vm_update: (vm_id, update_spec, cb) ->
		@api.methodCall 'hosting.vm.update', [@apikey, vm_id, update_spec], cb

	## Operation API ##
	operation_cancel: (operation, cb) ->
		@api.methodCall 'operation.cancel', [@apikey, operation], cb

	# TODO opts
	operation_count: (cb) ->
		@api.methodCall 'operation.count', [@apikey], cb

	operation_info: (operation, cb) ->
		@api.methodCall 'operation.info', [@apikey, operation], cb

	# TODO opts
	operation_list: (cb) ->
		@api.methodCall 'operation.list', [@apikey], cb

	operation_relaunch: (operation, params, cb) ->
		@api.methodCall 'operation.relaunch', [@apikey, operation, params], cb

	## Catalog API ##
	# TODO currency, grid
	catalog_list: (opts, cb) ->
		@api.methodCall 'catalog.list', [@apikey, opts], cb

module.exports = Client