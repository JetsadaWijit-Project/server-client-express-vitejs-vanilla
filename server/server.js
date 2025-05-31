const cors = require('cors');
const express = require('express');
const app = express();
const PORT = 3000;

app.use(cors());
app.use(express.json()); // Enable JSON parsing

// Example GET endpoint
app.get('/api/message', (req, res) => {
  res.json({ message: 'Hello from Express!' });
});

// Example POST endpoint
app.post('/api/echo', (req, res) => {
  res.json({ received: req.body });
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});
