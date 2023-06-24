const mongoose = require('mongoose');
const bcrypt = require("bcryptjs");



const UserSchema = new mongoose.Schema({
    name: {
        type: String,
        required: [true, "name can't be empty"]
    },
    mobileNumber: {
        type: Number,
        unique: true,
        required: [true, "phone no can't be empty"]
    },
    password: {
        type: String,
    },
    district: {
        type: String,
        required: [true, "district is required"]
    },
    taluk:{
        type:String,
        required: [true, "taluk is required"]
    },
    block:{
        type:String,
        required: [true, "block name is required"]
    },
    kb:{
        type:String,
        required: [true, "krishibhavan is required"]
    },
    wardno:{
        type:String,
        required: [true, "ward number is required"]
    },
    role:{
        type:String,
        enum:["farmer","wardMember","officer"]
    }
},{timestamps:true});


UserSchema.pre("save", async function () {
    if (!this.isModified("password")) return;
    const salt = await bcrypt.genSalt(10);
    this.password = await bcrypt.hash(this.password, salt);
  });


  UserSchema.methods.comparePassword = async function (candidatePassword) {
    const isMatch = await bcrypt.compare(candidatePassword, this.password);
    return isMatch;
  };

module.exports= mongoose.model('User',UserSchema);

