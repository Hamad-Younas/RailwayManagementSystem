const Product = require('../models/user');


async function createProduct(req,res){
    try{

        const product=await Product.create(req.body);
        res.status(201).json(product);
    }catch(err){
        res.status(500).json({error: err.message});

    }
}

async function getAllProducts(req, res) {
    try {
        const products = await Product.find({}, 'email');
        const emails = products.map(product => product.email);
        res.json(emails);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
}

async function updateProduct(req,res){
    try{
        const{id}=req.params;
        const updatedProduct=await Product.findByIdAndUpdate(id,req.body,{new:true});
        res.json(updateProduct);

    }catch(err){
        res.status(500).json({error:err.message});

    }

}async function deleteProduct(req, res) {
    try {
        const { title } = req.params;
        console.log(`Deleting email with title: ${title}`);
        
        // Use { title } in the query instead of { email: title }
        const deletedAnnouncement = await Product.findOneAndDelete({ title });

        if (!deletedAnnouncement) {
            return res.status(404).json({ message: 'email not found' });
        }

        res.sendStatus(204);
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: 'Internal Server Error' });
    }
}

async function loginfunc(req, res) {
    try {
        const user = await Product.findOne({ email: req.body.email });

        if (!user || user.password !== req.body.password) {
            return res.status(400).send({ message: 'Invalid first name or password' });
        }
        res.send({ message: "Login successful", user });
        
    } catch (error) {
        res.status(400).send(error);
    }
};


async function signupFunc(req, res) {
    try {
        // Check if the email is already registered
        const existingUser = await Product.findOne({ email: req.body.email });
        if (existingUser) {
            return res.status(400).send({ message: 'Email is already registered' });
        }
        console.log(req.body);

        // Save the user to the database
        const user = await Product.create(req.body);
        res.status(201).json(user);
        //res.status(201).send({status:true, message: 'User registration successful', user: newUser });
    } catch (error) {
        res.status(400).send({ message: 'User registration failed', error });
    }
}




async function login(req, res, next) {

    const { firstName, password } = req.body;
    
    try {
    
    const user = await Product.findOne({ firstName });
    
    if (!user) return res.status(404).json({ error: 'User not found' });
    
    if (user.password != password) return res.status(401).json({ error: 'Invalid credentials' });
    
    var token = GenerateToken(user);
    
    return res.status(200).json({
    
    message: 'Logged in successfully',
    
    // email: email,
    
    firstName: user.firstName,
    
    userid: user.id,
    
    token: token,
    
    });
    
    } catch (err) {
    
    return res.status(500).json({ message: err });
    
    }
    
    };



//helping func
const jwt = require('jsonwebtoken'); // Import the jwt library

function GenerateToken(user) {

const payload = {

role: user.role,

id: user._id,

};

const token = jwt.sign(payload, 'texguitgdsedsesdsededed.ededxdxedf');
return token;

};
async function admindashboard(req,res){
    return res.status(200).json({
            message: 'welcome to admin dashboard',
            
          });
  }
async function superadmindashboard(req,res){
    return res.status(200).json({
            message: 'welcome to super user',
            
          });
  }
async function dashboard(req,res){
    return res.status(200).json({
            message: 'welcome to super user and admin',
            
          });
  }
function publicEndpoint(req, res) {
    return res.status(200).json({
        message: 'welcome public user'
    });
}

module.exports={
    createProduct,
    updateProduct,
    deleteProduct,
    getAllProducts,
    admindashboard,
    superadmindashboard,
    publicEndpoint,
    dashboard,
    login,
    loginfunc,
    signupFunc,
};