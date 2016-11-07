# -*- coding: utf-8 -*-

#
# Created by thiswind on 2016/11/7.
#


import json
from jinja2 import Template

host_list = json.load(open('host_list.json'))

template = Template(open('auto_gen_reverse_proxy.conf.jinja2').read())
script = template.render(host_list=host_list)

print script