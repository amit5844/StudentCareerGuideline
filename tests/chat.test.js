const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const route = fs.readFileSync(path.join(__dirname, '../backend/routes/chat.js'), 'utf8');
const ui = fs.readFileSync(path.join(__dirname, '../assets/js/chatbot.js'), 'utf8');
test('chat endpoint validates input and has safe fallback guidance', () => {
  assert.match(route, /max\(700\)/);
  assert.match(route, /function fallback/);
  assert.match(route, /OPENAI_API_KEY/);
  assert.match(route, /official/);
});
test('chatbot UI has accessible launcher and clear guidance disclaimer', () => {
  assert.ok(ui.includes('aria-label="Open Career Buddy chat"'));
  assert.ok(ui.includes('official sources'));
  assert.ok(ui.includes('localReply'));
});
