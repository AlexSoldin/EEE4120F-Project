import hashlib
import os
import time

# Input
# TARGET = "4405632c5fce288684b7f73576ecd9d6" #akha
# TARGET = "2db1850a4fe292bd2706ffd78dbe44b9" #vader
TARGET = "24eb05d18318ac2db8b2b959315d10f2" #coffee
# TARGET = "b41779690b83f182acc67d6388c7bac9" #jackson

# Constants
LENGTH = 10
VALUES = range(97, 122) #all characters from 'a' to 'z'
DISPLAY_GUESSES = False

# Variables
# endTime = 0

# Creates a new target
def newHashTarget(word):
	hashObject = hashlib.md5(word.encode())
	print("The hexadecimal equivalent of", word, "is :", hashObject.hexdigest()) 

# Checks if hash matches the target
def checkPassword(password):
	global startTime

	password = password [::-1]
	toCheck = hashlib.md5(password.encode())

	global count
	count += 1

	if (toCheck.hexdigest() == TARGET):
		endTime = time.time()
		print("\n\nPassword: {0}\nTime: {1} seconds\nGuesses: {2}\nSpeed: {3} hashes/second\n\n"
		.format(password, endTime-startTime, count, (count/(endTime-startTime))))
		os._exit(1)

# Recursively iterates over all character combinations
def charCombination(length, currentPosition, output):
	for letter in VALUES:
		newOutput = output + "%c" % letter
		if (currentPosition < length - 1):
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

count = 0
startTime = time.time()
bruteForce()
