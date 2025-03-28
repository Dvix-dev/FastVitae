from flask import Flask, request, jsonify

app = Flask(__name__)

if __name__ == '__main__':
    app.run(debug=True)

@app.route('/'):
    def index():
        return "Welcome to the Flask API!"