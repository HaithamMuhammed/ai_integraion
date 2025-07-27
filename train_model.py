from sklearn.ensemble import RandomForestClassifier
import pickle

# Sample dummy training data
X = [
    [1, 0, 1, 1, 1],  # outlook_rainy, outlook_sunny, temp_hot, temp_mild, humidity_normal
    [0, 1, 0, 1, 1],
    [0, 1, 1, 0, 1],
    [1, 0, 0, 1, 1],
    [1, 0, 1, 0, 1],
]
y = [1, 1, 0, 0, 1]  # 1 = will play, 0 = will not

# Train the model
model = RandomForestClassifier()
model.fit(X, y)

# Save the model again using your current sklearn version
with open("random_forest_model.pkl", "wb") as file:
    pickle.dump(model, file)

print("Model retrained and saved successfully.")
