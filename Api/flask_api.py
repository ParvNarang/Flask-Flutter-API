from flask import Flask, request, jsonify
import base64

app = Flask(__name__)

@app.route('/api', methods = ['GET'])
def returnresult():
	result = {}
	string_to_convert = bytes(request.args['q'],'utf-8')
	operation = str(request.args['op'])
	if operation=="decode" or operation=="dec":
		try:
			converted_string = string_to_convert.decode("utf-8")
			converted_string = base64.b64decode(converted_string).decode("utf-8")
			result["decoded"] = converted_string
		except ValueError:
		    print("Oops!")
		    result["decoded"] = "error"
		except TypeError:
		    print("Oops!")
		    result["decoded"] = "error"
		else:
		    print("No exception occurred.")

	elif operation=="encode" or operation=="enc":
		converted_string = base64.b64encode(string_to_convert).decode("utf-8")
		result["encoded"] = converted_string

	else:
		print("none")

	return jsonify(result)

if __name__ == "__main__":
	app.run(debug=True)