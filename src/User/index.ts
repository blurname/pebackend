import { Router, Response } from 'farrow-http'
import { prisma } from '../db'

export const user = Router()

type User = {
  name: string
  password: string
}

const signUp = async (user: User) => {
	console.log(user)
  const signedUser = await prisma.user.findFirst({
    where: {
      name: user.name,
      password: user.password,
    },
  })
  console.log(signedUser)
  return signedUser
}

user.get('/signin/?<name:string>&<password:string>').use(async (req) => {
  const user = await signUp({
    name: req.query.name,
    password: req.query.password,
  })
	console.log('here')
  return Response.json(user)
})

user.get('/info').use((req) => {
	console.log('info')
	return Response.text('info')
})


