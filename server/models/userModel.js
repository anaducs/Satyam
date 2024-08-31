import mongoose from "mongoose";
const userScheema = new mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true,
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const re = /^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$/;
                return value.match(re);
            },
            message: 'please enter a valid email',
        }
    },
    password: {
        required: true,
        type: String,
         validate: {
            validator: (value) => {
                 return value.length > 6;
            },
            message: 'password mustbe more than 5 digit',
        }
            
    },
    address: {
        type: String,
        default: '',
    },
    type: {
        type: String,
        default: 'user',
        
    },
}
);

export const UserModel = mongoose.model('UserModel', userScheema);