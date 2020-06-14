import hashlib
import os
import time

# Input
TARGET = "2db1850a4fe292bd2706ffd78dbe44b9" #vader
#TARGET = "04668875412db9993629099fd66d444d" #labrador
#TARGET = "dd22141acb5ea065acd5ed773729c98f" #alexander

# Constants
LENGTH = 10
VALUES = range(97, 122) #all characters from 'a' to 'z'
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

# Recursively iterates over all character combinations
def charCombination(length, currentPosition, output):
	for letter in VALUES:
		newOutput = output + "%c" % letter
		if (currentPosition < length):
			charCombination(length, currentPosition+1, newOutput)
		else:
			checkPassword(newOutput)
			if (DISPLAY_GUESSES):
				print("Guess:", newOutput)

# Iterates over all characters up to a predefined length
def bruteForce():
	for length in range(1, LENGTH + 1):
		if (DISPLAY_GUESSES):
			print("Password Length:",length)
		charCombination(length, 0, "")

# Main method
def main():
	global startTime
	startTime = time.time()
	bruteForce()

main()