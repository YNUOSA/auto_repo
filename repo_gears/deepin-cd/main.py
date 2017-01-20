import commands, os, time


def main():
    f = open("SUB_DIR")
    mirrorname = f.read()
    commands.getstatusoutput("python Json.py " + mirrorname + " syncing")
    logg(mirrorname, "", "syncing")

    cmd = "bash ./rsync.sh"
    status, output = commands.getstatusoutput(cmd)
    if (status == 0):
        commands.getstatusoutput("python Json.py " + mirrorname + " succeed")
        logg(mirrorname, "", "succeed")
    else:
        commands.getstatusoutput("python Json.py " + mirrorname + " failed")
        logg(mirrorname, status, "\n" + output)


def logg(name, errcode, errtext):
    f = open("LOG_FILE")
    s = f.read()
    f.close()
    f = open(s, "a")
    timeformat = '%Y-%m-%d %X'
    f.write(time.strftime(timeformat) + "[" + name + "]:" + str(errcode) + errtext + "\n")
    f.close()
    return


main()
