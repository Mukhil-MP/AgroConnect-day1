const mongoose = require('mongoose');
const bcrypt = require('bcrypt');



const UserSchema = new mongoose.Schema({
    name: {
        type: String,
        required: [true, "name can't be empty"]
    },
    phone: {
        type: Number,
        unique: true,
        required: [true, "name can't be empty"]
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


UserSchema.pre("save",async function(){
    var user = this;
    if(!user.isModified("password")){
        return
    }
    try{
        const salt = await bcrypt.genSalt(10);
        const hash = await bcrypt.hash(user.password,salt);

        user.password = hash;
    }catch(err){
        throw err;
    }
});


//used while signIn decrypt
UserSchema.methods.comparePassword = async function (candidatePassword) {
    try {
        console.log('----------------no password',this.password);
        // @ts-ignore
        const isMatch = await bcrypt.compare(candidatePassword, this.password);
        return isMatch;
    } catch (error) {
        throw error;
    }
};

module.exports= mongoose.model('User',UserSchema);

