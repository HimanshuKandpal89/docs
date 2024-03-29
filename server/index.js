const express = require("express"); // from this we are importing the express 
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

// const PORT = process.env.PORT | 3002;
const PORT = process.env.PORT | 3001;

const app = express(); // intializing the express

// app.useis the middleware between the server and client 
// app.use(express.json());
app.use(express.json());
app.use( authRouter);


const DB = "mongodb+srv://himanshupandita44:Himanshu24@cluster0.wcge5nx.mongodb.net/?retryWrites=true&w=majority";


// The .then() function in JavaScript is used to handle asynchronous tasks such as an API call. It is defined in the Promise API and is used to associate the functions to be invoked on the Promise when it is resolved.
mongoose.connect(DB).then(() =>{
    console.log('connected to database')  ;  
}).catch((err)=>{
    console.log(err);
})

app.listen(PORT,"0.0.0.0", ()=>{
    console.log(`connected at port ${PORT}`);
   
}); //used to start the serverll