import commands, os, time, json


def main():
    f = open("SUB_DIR")
    mirrorname = f.read()
    # commands.getstatusoutput("python Json.py " + mirrorname + " syncing")
    jsonlog(mirrorname, "syncing")
    logg(mirrorname, "", "syncing")

    cmd = "bash ./do_rsync.sh"
    status, output = commands.getstatusoutput(cmd)
    if (status == 0):
        # commands.getstatusoutput("python Json.py " + mirrorname + " succeed")
        jsonlog(mirrorname, "succeed")
        logg(mirrorname, "", "succeed")
    else:
        # commands.getstatusoutput("python Json.py " + mirrorname + " failed")
        jsonlog(mirrorname, "failed")
        logg(mirrorname, status, "\n" + output)


def logg(name, errcode, errtext):
    f = open("LOG_FILE")
    s = f.read()
    s = s.strip()
    f.close()
    f = open(s, "a")
    timeformat = '%Y-%m-%d %X'
    f.write(time.strftime(timeformat) + "[" + name + "]:" + str(errcode) + errtext + "\n")
    f.close()
    return


def jsonlog(mirrorname, mirrorstat):
    f = open("JSON_FILE")
    s = f.read()
    s = s.strip()
    f.close()
    if (not os.path.exists(s)):
        f = open(s, 'a')
        f.close()
    f = open(s)
    job = json.load(f)
    f.close()

    modified = 0
    timeformat = '%Y-%m-%d %X'

    for i in job:
        if (i["mirrorname"] == mirrorname):
            i["mirrorstatus"] = mirrorstat
            i["time"] = time.strftime(timeformat)
            modified = 1
    if (not modified):
        count = len(job)
        mirror = {"mirrorname": mirrorname, "mirrorstatus": mirrorstat, "time": time.strftime(timeformat)}
        job.append(mirror)

    f = open(s, "w")
    f.write(json.dumps(job))


main()
