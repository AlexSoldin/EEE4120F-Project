import hashlib
import os
import time

# Input
#TARGET = "2db1850a4fe292bd2706ffd78dbe44b9" #vader
TARGET = "5f4dcc3b5aa765d61d8327deb882cf99" #password
#TARGET = "714ab9fbdad5c5da1b5d34fe1a093b79" #pug

# Constants
LENGTH = 8
DISPLAY_GUESSES = True

# Variables
count = 0
startTime = 0
endTime = 0

# Creates a new target
def newHashTarget(word):
	hashObject = hashlib.md5(word.encode())
	print("The hexadecimal equivalent of", word, "is :", hashObject.hexdigest()) 

# Checks if hash matches the target
def checkPassword(password):
	global count
	count += 1

	global startTime
	global endTime

	toCheck = hashlib.md5(password.encode())

	if (toCheck.hexdigest() == TARGET):
		endTime = time.time()
		print("\n\nPassword: {0}\nTime: {1} seconds\nGuesses: {2}\nSpeed: {3} hashes/second\n\n"
		.format(password, endTime-startTime, count, (count/(endTime-startTime))))
		os._exit(1)
    
# Iterates over all possible passwords in textfile
def dictAttack():
    inputFile = open("passwords.txt", "r")
    for instance in inputFile:
        instance = instance.replace('\n', '')
        if (DISPLAY_GUESSES):
            print("Guess:", instance)
        checkPassword(instance)


# Main method
def main():
    global startTime
    startTime = time.time()
    dictAttack()
    
main()