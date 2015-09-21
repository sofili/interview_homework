# interview_homework

Structure:
Communication - Handle the communication of sending and receiving from the API
GuideManager - Handle parsing the JSON response to the model
ViewController - Display the object model/dictionary to the table view

Model:
  -GuideCollection
    - Guide
      - Venue
      
Third-party framework:
JSONModel - https://github.com/icanzilb/JSONModel
For handling the parsing and serialization

Things to improve:
* Wrap the text if the string is too long
* Add autolayout for different form factors
* Add unit test
