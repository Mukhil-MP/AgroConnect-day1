//const User = require('./user');
const app = require('./app');
const db = require('./config/db')
const farmerModel = require('./model/farmerModel');
const officerModel = require('./model/officerModel');
const memberModel = require('./model/memberModel');
const scrapeModel = require('./model/scrapeModel');
const otpModel = require('./model/otpModel');
const complaintModel = require('./model/complaintModel');
const memberNotificationModel = require('./model/memberNotificationModel');
const officerNotificationModel = require('./model/officerNotificationModel');
const chatModel = require('./model/chatModel');

const port = 3000;
/* 
app.get('/',(req,res)=>{
    res.send("hello world");
});
*/

app.listen(port,()=>{
    console.log(`Server listening..... ${port}`);
}); 