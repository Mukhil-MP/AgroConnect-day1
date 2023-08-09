const express = require('express');
const userRouter = express.Router();
const user = require('./user.handlers');

userRouter.post("/signup",user.signup)
userRouter.post("/create",user.create)
userRouter.post('/password',user.passwordCreate)
userRouter.post('/login',user.login)
userRouter.patch('/edit',user.edit)
userRouter.post('/upload',user.upload)
userRouter.post('/notify/upload',user.notifyUpload)
userRouter.post('/notify/view',user.notifyView)
userRouter.post('/complaint/register',user.complaintRegister)
userRouter.post("/complaint/officerview",user.complaintViewOfficer)
// userRouter.post('/complaint/new',user.complaintNew)
// userRouter.post('/complaint/notResponded',user.complaintNotRes)
// userRouter.post('/complaint/responded',user.complaintRes)
// userRouter.post('/complaint/setNotReplyed',user.complaintSetNotReplyed)
// userRouter.post("/complaint/giveReply",user.complaintGiveReply)

module.exports = userRouter;