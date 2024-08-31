import {app} from "./app.js";
import dotenv from 'dotenv';
import { connectDb } from "./config/db.js";
dotenv.config();
const port = process.env.PORT;
await connectDb();

app.listen(port,"0.0.0.0", () => {
    console.log(`server is running on http://localhost:${port} `);
})

