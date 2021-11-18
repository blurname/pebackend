import { Router, Response } from 'farrow-http'
import { prisma } from '../db'

export const user = Router()

type User = {
  name: string
  password: string
}

const signUp = async (user: User) => {
  const isExisted = await prisma.user.findFirst({
    where: {
      name: user.name,
    },
  })
	if(isExisted !== null){
		return null
	}
  const signedUser = await prisma.user.create({
		data:{
			name:user.name,
			password:user.password
		}
  })
  return signedUser
}
const signIn = async (user: User) => {
	console.log('signin:',user)
  const signedUser = await prisma.user.findFirst({
    where: {
      name: user.name,
      password: user.password,
    },
  })
	console.log('signedUser:', signedUser)
  return signedUser
}

user.get('/signin/?<name:string>&<password:string>').use(async (req) => {
  const user = await signIn({
    name: req.query.name,
    password: req.query.password,
  })
	console.log(user)
  return Response.json(user)
})

user.post('/signup/?<name:string>&<password:string>').use(async (req) => {
  const user = await signUp({
    name: req.query.name,
    password: req.query.password,
  })
	console.log(user)
  return Response.json(user)
})

user.get('/info').use((req) => {
	console.log('info')
	return Response.text('info')
})



