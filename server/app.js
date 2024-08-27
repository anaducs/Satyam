import express, { json } from 'express';
import cors from 'cors';
import http from 'http';

export const app = express();




app.use(express.json({ limit: "10mb" }));
app.use(express.urlencoded({ extended: true }));
app.use(cors);
app.options('*', cors);


