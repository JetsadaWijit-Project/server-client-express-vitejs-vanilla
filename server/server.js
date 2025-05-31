const cors = require('cors');
const express = require('express');
const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json()); // Enable JSON parsing

// GET /
app.get('/', (req, res) => {
  res.send('Hello World!');
});

// GET /api/message
app.get('/api/message', (req, res) => {
  res.json({ message: 'Hello from Express!' });
});

// POST /api/echo
app.post('/api/echo', (req, res) => {
  res.json({ received: req.body });
});

// Catch-all route to handle undefined routes
app.use((req, res) => {
  res.redirect("/");
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
