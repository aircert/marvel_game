# Text Based Marvel Combat Arena

### How-To-Run:

```
ruby -v == '2.5.3'
ruby main.rb

Example Input:
Player One
Name of your character
hulk
What is your SEED (1-9)?
2
Player Two
Name of your character
spider-man
What is your SEED (1-9)?
2
TIE 
```

### Objective:
Please create a text based Marvel character combat arena using their public API available at: https://developer.marvel.com/ The combat arena will take 2 provided character names and then choose the winner based on the length of a specific word in their bio. Your code should demonstrate your ability to interface with an authenticated API, accept input from a user, and deal gracefully with errors and edge cases. 

### Details:
Marvel’s developer portal has an API full of information about their greatest comics and characters which we’d like to utilize in this assessment so you will need to create a free Marvel Insider account in order to access it. After signup you should create an API key and familiarize yourself with the API documentation here: https://developer.marvel.com/documentation/getting_started 

For this assessment, we will focus on the description field of the “characters” endpoint which can be accessed as such: http://gateway.marvel.com/v1/public/characters?name=spider-man Please NOTE that this link will fail without the corresponding authentication parameters provided, but it is up to you to figure out how to authenticate successfully from the documentation.

Your code should satisfy the following criteria:

  - The user will provide 2 character names to do battle in the arena
  - The user will provide a SEED number between 1-9
  - Retrieve the bio for each character and parse the “description” field
  - Choose the WORD in each description corresponding to the provided SEED
  - The winner of the battle is the character whose WORD has the most characters EXCEPT if either character has a MAGIC WORD “Gamma” or “Radioactive” they automatically Win
  - Present the winning character to the user
  - Handle any errors or edge cases and display the message in a user friendly manner
  - Provide clear instructions on how to retrieve and run your code


* Disclaimer: Do not abuse API - My private/public key are hard coded
