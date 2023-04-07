# Connecting Flutter with Python using Flask

A basic implementation of **flask with flutter** to show how to receive responses and send requests.

- We create a communication channel between the client-side Flutter app and the server-side Python application, this communication happens over the **HTTP** protocol.

- In this architecture, the Flask app acts as an intermediary between the client and the server side, handling incoming requests from the Flutter app, processing them and sending back the appropriate responses.

- To make this work, you need to create an HTTP server using Flask on the Python side, which listens for incoming requests and sends responses back.

- And on the Flutter side, we have used an HTTP client library to send requests to the Flask app and receives responses from it. We send our requests in the form of **query parameters** to the backend.

<p align="center">
  <img src="https://github.com/ParvNarang/Flask-Flutter-API/blob/66d150fd1d49f8948784f67288b8fb407d080333/assets/images/query_parameter.png">
</p>

This app is a base64 converter that encodes/decodes the input provided by the user. This input and operation(encode/decode) is sent to the flask server via a **GET request** which then converts our text into the desired output and sends to our client as **JSON response**. The result is then shown to the user.

For now we have to run our flask server on the terminal locally, just navigate to the project folder and type the below on the terminal.

```
cd Api/

python3 flask_api.py
```

### Flutter and Flask Integration Diagram

<p align="center">
  <img src="https://github.com/ParvNarang/Flask-Flutter-API/blob/66d150fd1d49f8948784f67288b8fb407d080333/assets/images/diagram.png">
</p>

### App Home Page

<p align="center">
  <img src="https://github.com/ParvNarang/Flask-Flutter-API/blob/66d150fd1d49f8948784f67288b8fb407d080333/assets/images/encode_1.png" width="300">
  &nbsp;&nbsp;
  <img src="https://github.com/ParvNarang/Flask-Flutter-API/blob/66d150fd1d49f8948784f67288b8fb407d080333/assets/images/decode_1.png" width="300">
</p>