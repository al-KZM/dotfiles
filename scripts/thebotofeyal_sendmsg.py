#!/usr/bin/python3

##############################################
#
# send_msg.py
# thebotofeyal
#
##############################################


import requests as req
import click
import subprocess
import javac_parser

COMPILING_SCRIPT="/home/eyal/.config/scripts/java_compile_notrace.sh"
DELETE_SCRIPT="/home/eyal/.config/scripts/java_delete_traces.sh"
EXAM_FILE="/home/eyal/documents/university/courses_notes/java_1/Exam/Exam.java"
EXAM_DIR="/home/eyal/documents/university/courses_notes/java_1/Exam/"


EYAL_ID = "1148205096"
TOKEN = "1661976868:AAG5koBu5t6AgG2GfD5adIBjQC9HRRqsO8k"

base_url = f"https://api.telegram.org/bot{TOKEN}"


@click.group()
def cli():
    pass

def send_message(text="", chat_id=EYAL_ID):
    payload = {
        "Content-Type": "application/x-www-form-urlencoded",
        "chat_id":chat_id,
        "text":text,
    }

    uri = "/sendMessage"
    r = req.post(base_url+uri, data=payload)

def send_script_stdout(script_fpath, chat_id=EYAL_ID):
    out = subprocess.run(['sh', script_fpath], capture_output=True)
    send_message(text=out.stdout.decode('utf-8'), chat_id=chat_id)

def send_script_stderr(script_fpath, chat_id=EYAL_ID):
    out = subprocess.run(['sh', script_fpath], capture_output=True)
    send_message(text=out.stderr.decode('utf-8'), chat_id=chat_id)

@cli.command()
def send_output(chat_id=EYAL_ID):
    proc = subprocess.run(['sh', COMPILING_SCRIPT], capture_output=True, cwd=EXAM_DIR)
    err = proc.stderr
    if err:
        send_message(text=err)
        return
    else:
        p = subprocess.run(["java", "Exam"],capture_output=True, cwd=EXAM_DIR)
        out = p.stdout

    if not out: out = "EMPTY"

    subprocess.run(["sh", DELETE_SCRIPT])

    send_message(text=out)



@cli.command()
@click.argument("filepath")
def send_syntax_check(filepath):
    java = javac_parser.Java()
    code = open(filepath,'r').read()
    errors = java.check_syntax(code)

    for err in errors:
        if err[0].upper() == "ERROR":
            found = True

            err_msg = err[2]
            line = err[3]
            col = err[4]
            char_ix = err[5]

            s = f'L{line} "{err_msg}" (col {col})'
            send_message(s)
            return

    send_message(text="OK")





if __name__ == "__main__":
    cli()


