import { MidwayConfig } from '@midwayjs/core';

export default {
  // use for cookie sign key, should change to your own and keep security
  keys: '1648352786220_6697',
  koa: {
    port: 7001,
  },
  cors: {
    credentials: false,
    origin: '*',
    method: 'POST',
  },
  upload: {
    // mode: UploadMode, 默认为file，即上传到服务器临时目录，可以配置为 stream
    mode: 'file',
    // fileSize: string, 最大上传文件大小，默认为 10mb
    fileSize: '10mb',
    // whitelist: string[]，文件扩展名白名单
    whitelist: ['.jpg', '.jpeg', '.png'],
    // tmpdir: string，上传的文件临时存储路径
    tmpdir: './',
    // cleanTimeout: number，上传的文件在临时目录中多久之后自动删除，默认为 5 分钟
    cleanTimeout: 0,
  },
} as MidwayConfig;
