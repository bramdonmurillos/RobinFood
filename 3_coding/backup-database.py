import sys
import os
class backup():
    def __init__(self:)
    target = ""
    os.chdir("C:\\Services\\wampp\\mysql\\bin")
    os.system("mysqldump -u root -p $pwd-mysql test-database test-database.sql")

if __name__=="__main__":
    backup()
    sys.exit()