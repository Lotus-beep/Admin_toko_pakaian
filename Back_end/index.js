import express from 'express';
import db from './configdatabase.js';
import './Model/Model.js'; 
import router from './Router/router.js';
import cors from 'cors'
import { json } from 'sequelize';

const app = express();
const port = 8000;

try {
  await db.authenticate();
  console.log('Database connected.');

  await db.sync({ alter: true });
  console.log('All models were synchronized successfully.');
} catch (error) {
  console.error('Unable to connect to the database:', error);
}

app.use(
  cors({
    origin: "http://localhost:3000",
  })
);
app.use(express.json())
app.use(router)


app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
