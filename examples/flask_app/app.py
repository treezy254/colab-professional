from flask import Flask, render_template, request
import pandas as pd

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/analyze', methods=['POST'])
def analyze():
    # Load Titanic dataset
    df = pd.read_csv('https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv')

    # Example analysis: survival rate by class
    analysis = df.groupby('Pclass')['Survived'].mean().to_dict()

    return render_template('index.html', analysis=analysis)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
