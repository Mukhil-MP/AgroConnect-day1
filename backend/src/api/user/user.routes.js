const express = require('express');
const userRouter = express.Router();
const user = require('./user.handlers');

userRouter.post("/signup",user.signup)
userRouter.post("/create",user.create)
userRouter.post('/password',user.passwordCreate)
userRouter.post('/login',user.login)
userRouter.patch('/edit',user.edit)
userRouter.post('/upload',user.upload)

module.exports = userRouter;