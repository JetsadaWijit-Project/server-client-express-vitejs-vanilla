document.getElementById('getMessage').onclick = async () => {
  const res = await fetch('http://localhost:3000/api/message');
  const data = await res.json();
  document.getElementById('output').textContent = JSON.stringify(data, null, 2);
};

document.getElementById('postData').onclick = async () => {
  const res = await fetch('http://localhost:3000/api/echo', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ user: 'vite-client', msg: 'Hello!' })
  });
  const data = await res.json();
  document.getElementById('output').textContent = JSON.stringify(data, null, 2);
};
