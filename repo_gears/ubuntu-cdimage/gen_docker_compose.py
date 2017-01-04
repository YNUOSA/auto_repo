# -*- coding: utf-8 -*-

#
# Created by thiswind on 2016/11/16.
#


from jinja2 import Template

f = open('../NFS_LOCAL_DIR')
nfs_local_dir = f.read()
f.close()

f = open('SUB_DIR')
sub_dir = f.read()
f.close()

sub_dir = sub_dir.strip()

deepin_dir = '%s/%s' % (nfs_local_dir, sub_dir)

template = Template(open('docker-compose.template.jinja2').read())
script = template.render(deepin_dir=deepin_dir)

print script
