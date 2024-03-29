const express = require("express");
const User = require("../models/user");
 

const authRouter = express.Router(); 

authRouter.post('/api/signup',async (req,res)=>{
    try{
        const {name,email,profilepic}= req.body;
        // with request we are going  to acess whatever information we are receving from the clientside

        // check if email already exists 
        // let user = await User.FindOne({email});
        let user = await User.findOne({email});

        // if user is not present  then create new instance of the model and save it in the database

        if(!user){
            user = new User({
                name,
                email,
                profilepic,
            });
            // saving the data in the databse       
            user = await user.save();
        }

       
        res.json({user});

    }
    catch(e){
        res.status(500).json({error: e.message})
    }
}) ;
module.exports = authRouter;