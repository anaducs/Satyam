import express from 'express';
import cors from 'cors';
import {errorHandler} from './middleware/error_handling.js';
import  authRouter from './routes/auth.js';


export const app = express();


app.use(express.json({ limit: "10mb" }));
app.use(express.urlencoded({ extended: true }));

app.use(cors());
app.options('*', cors());


app.use('/', authRouter);

app.use((req, res, next) => {
    const error = new Error('not found')
    error.status = 404;
    next(error);
})

app.use(errorHandler);

