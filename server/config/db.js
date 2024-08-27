import { config } from 'dotenv';
config();
import mongoose from 'mongoose';
import expressAsyncHandler from 'express-async-handler';

export const connectDb = expressAsyncHandler(async () =>
{
    const dbUrl = process.env.DB_CONNECTION_URL;
    if (!dbUrl) {
        throw new Error('Db connection string missing');
    }
   const test = await mongoose.connect(dbUrl,);
    if (test)
        {
        console.log('connected');
        }
    
}
)