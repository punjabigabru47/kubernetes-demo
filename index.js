import express from "express";

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Hello from a container!",
    service: "hello-node",
    pod: process.env.POD_NAME || "unknown",
    date: new Date().toISOString(),
  });
});

app.get("/readyz", (req, res) => {
  res.json({
    status: 200,
    message: "ready",
  });
});

app.get("/health", (req, res) => {
  res.json({
    status: 200,
    message: "healthy",
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}!`);
});
