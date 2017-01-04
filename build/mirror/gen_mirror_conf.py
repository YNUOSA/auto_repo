# coding=utf-8 #

from jinja2 import Template
import os, csv, shutil

path = os.path.dirname(os.path.dirname(os.getcwd()))
mirror_dir = "{{ mirror_dir }}"


def writefile(mirrorname, mirrorlink, start_all_file, clean_all_file):
    # make directory
    mirrorconfpath = path + "/repo_gears/" + mirrorname
    if not os.path.exists(mirrorconfpath):
        os.mkdir(mirrorconfpath)

    # copy same files
    filelists = ['clean.sh', 'Dockerfile', 'sources.list.tuna', 'gen_docker_compose.py']
    for line in filelists:
        shutil.copyfile('./solidfiles/' + line, mirrorconfpath + '/' + line)
    # make docer-compose.template.jinja2
    f = open(mirrorconfpath + "/docker-compose.template.jinja2", 'w')
    template = Template(open('./template/docker-compose.template.template.jinja2').read())
    script = template.render(mirrorname=mirrorname, mirror_dir=mirror_dir)
    f.write(script)
    f.close()
    # make do_rsync.sh
    f = open(mirrorconfpath + "/do_rsync.sh", 'w')
    template = Template(open('./template/do_rsync.template.jinja2').read())
    script = template.render(miror_up_stream=mirrorlink)
    f.write(script)
    f.close()
    # make start.sh
    f = open(mirrorconfpath + "/start.sh", 'w')
    template = Template(open('./template/start.sh.jinja2').read())
    script = template.render(mirrorname=mirrorname)
    f.write(script)
    f.close()
    # make SUB_DIR
    f = open(mirrorconfpath + "/SUB_DIR", 'w')
    f.write(mirrorname)
    f.close()
    # modify start_all.sh and clean_all.sh
    start_all_file.write("cd " + mirrorconfpath + "\n")
    start_all_file.write("bash start.sh &" + "\n")
    clean_all_file.write("cd " + mirrorconfpath + "\n")
    clean_all_file.write("bash clean.sh &" + "\n")


def main():
    csvfile = open(os.getcwd() + "/mirrorlist.csv")
    csvreader = csv.reader(csvfile)

    repopath = path + "/repo_gears"
    if not os.path.exists(repopath):
        os.mkdir(repopath)

    start_all_file = open(path + "/repo_gears/start_all.sh", 'w')
    start_all_file.write("#!/usr/bin/env bash" + "\n")
    clean_all_file = open(path + "/repo_gears/clean_all.sh", 'w')
    clean_all_file.write("#!/usr/bin/env bash" + "\n")

    for line in csvreader:
        writefile(line[0], line[2], start_all_file, clean_all_file)


main()
