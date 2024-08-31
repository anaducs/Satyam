import express from "express";
import { userSignUp,userSignIn } from "../controllers/auth_controller.js";
const authRouter = express.Router();

authRouter.post('/api/signup', userSignUp);
authRouter.post('/api/signin', userSignIn);



export default authRouter;