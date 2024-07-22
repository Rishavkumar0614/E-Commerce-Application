const mongoose = require('../server/node_modules/mongoose');

const userSchema = mongoose.Schema({
    name: {
        trim: true,
        type: String,
        required: true,
    },
    email: {
        trim: true,
        type: String,
        required: true,
        validate: {
            validator: (val) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return val.match(re);
            },
            message: 'Please Enter a Valid Email Address',
        }
    },
    password: {
        type: String,
        required: true,
    },
    address: {
        default: '',
        type: String,
    },
    type: {
        type: String,
        default: 'user',
    },
});

const User = mongoose.model("User", userSchema);
module.exports = User;