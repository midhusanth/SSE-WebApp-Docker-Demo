from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/health")
def health():
    return jsonify(status="ok... v5.1")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)