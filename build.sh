
echo "Building Docker Image..."
docker build -t devsecops-app:v1 .
echo "Running Container..."
docker run -d -p 3000:3000 --name my-app devsecops-app:v1
echo "App is running on http://localhost:3000"