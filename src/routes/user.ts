import express from 'express'
import UserFormValidation from '../middleware/user/UserValidations'
import {createUser, getUser, getAllUsers, updateUser, deleteUser} from '../controllers/UserController'
import {updateBatch} from "../controllers/BatchController"
import {createPayment, deletePayment} from "../controllers/PaymentController"

const router = express.Router()

router.post('/',[UserFormValidation],createUser);
router.get('/:id', getUser);
router.get('/',getAllUsers);
router.patch('/:id',updateUser);
router.delete('/:id',deleteUser);

export default router;