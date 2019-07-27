# coding=gbk

from datetime import datetime

class Person:

    def __init__(self, name, weight, LostClac, EatClac, height):
        self.Weight = weight
        self.ExerciseClac = LostClac
        self.GetClac = EatClac
        self.Height = height

    def getMinHeat(self):
        return 26.0 * self.Weight

    def ResetWeight(self):
        self.Weight = self.Weight - (self.getMinHeat() + self.ExerciseClac - self.GetClac) / 7776
        
def GetCurrentDate():
    ''' Return today's date object '''
    import time
    curTime = time.localtime(time.time())
    return datetime(curTime.tm_year, curTime.tm_mon, curTime.tm_mday)

def FormatDate(date):
    return str(date.year) + '.' + str(date.month) + '.' + str(date.day)

if __name__ == "__main__":
    
    ''' Init person '''
    jedi = Person("Jedi", 80.8, 700, 1200)
    
    ''' Calculate exercise days '''
    currentDate = GetCurrentDate()
    targetDate = datetime(2017, 5, 1)
    targetDays = (targetDate - currentDate).days

    ''' Output exercise result '''
    for day in range(targetDays):
        jedi.ResetWeight()
        print "%s -> Weight: %s kg" % (FormatDate(currentDate), jedi.Weight)
