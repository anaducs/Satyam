import { UserModel } from "../models/userModel.js";
import expressAsyncHandler from "express-async-handler";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import pro from "dotenv";
pro.config();
const secretKey = process.env.SECRET_KEY;

export const userSignUp = expressAsyncHandler(async (req, res) => {
    const { name, email, password } = req.body;
    const exitingUSer = await UserModel.findOne({ email })
    if (exitingUSer) {
        return res.status(400).json({ message: 'Email already registered' });
    }
    const hashedPassword = await bcrypt.hash(password, 8);
    let newUser = new UserModel(
        {
            name,
            email,
            password : hashedPassword,
        }
    )
    newUser = await newUser.save();
    res.json({ newUser });
});

export const userSignIn = expressAsyncHandler(async (req, res) => {
    const { email, password } = req.body;
    const user = await UserModel.findOne({ email });
    if (!user) {
        return res
            .status(400)
            .json({ message: 'user not registered' });
    }
    const isApproved = await bcrypt.compare(password, user.password);
    if (!isApproved) {
        return res
            .status(400)
            .json({ message: 'password incorrect' });
    }
    const token = jwt.sign({ id: user._id }, secretKey)
    res.json({token, ...user._doc});
    
})