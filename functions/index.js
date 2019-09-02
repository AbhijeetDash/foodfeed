const functions = require('firebase-functions');
const admin = require('firebase-admin')
const express = require('express')  

const app = express()

app.get('/',(req, res)=>{
    res.setHeader('Access-Control-Allow-Origin', '*');
    var task ="", email = "", pass = ""
    if(req.query.task){
        task = req.query.task
        email = req.query.email
        pass = req.query.pass
        if(task === 'Login'){   
            fs.writeFileSync("Data.txt",email+" "+pass+" "+task)
            console.log("Login Code Goes Here")
        }
        if(task === 'Join us'){
            console.log("Sign-up Code Goes Here")
        }
    }
    res.send({task: task+" Successfull"}) 
})

exports.app = functions.https.onRequest(app)