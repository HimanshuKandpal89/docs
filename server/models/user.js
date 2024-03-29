const mongoose = require ('mongoose');
// we are defining the schema 
// this is how our data should look like
// structure of pur data
const userschema = new mongoose.Schema({
    name:{
        type:String,
        required:true,
    },
    email:{
        type: String,
        required: true,
    },
    profilepic:{
        type:String,
        required: true,
    }
});

const User = mongoose.model("User",userschema);
// making the user  model available to other parts of the app
module.exports = User;