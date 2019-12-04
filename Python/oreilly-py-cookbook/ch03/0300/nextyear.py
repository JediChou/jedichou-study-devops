# -*- coding: utf-8 -*-
# file: nextyear.py

import datetime

def main():
    today = datetime.date.today()
    next_year = today.replace(year=today.year+1).strftime("%Y.%m.%d")
    print next_year

if __name__ == "__main__":
    main()
