import json, sys, time

mirrorname = sys.argv[1]
mirrorstat = sys.argv[2]


def jsonlog(mirrorname, mirrorstat):
    f = open("JSON_FILE")
    s = f.read()
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
