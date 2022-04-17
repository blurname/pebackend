import {
  Controller,
  Get,
  Inject,
  Post,
  Files,
  Fields,
} from '@midwayjs/decorator';

@Controller('/')
export class HomeController {
  @Inject()
  ctx;
  @Get('/')
  async home(): Promise<string> {
    return 'Hello Midwayjs!';
  }
  @Post('/upload')
  async upload(@Files() files, @Fields() fields){
    console.log('hi there');
    console.log(files[0]);
    const serverImageName = files[0].data as string
    const lastSlash = serverImageName.lastIndexOf('\\')
    const serverName = serverImageName.slice(lastSlash+1)
    console.log(serverName)
    /*

    files = [
      {
        filename: 'test.pdf',        // 文件原名
        data: '/var/tmp/xxx.pdf',    // mode 为 file 时为服务器临时文件地址
        fieldname: 'test1',          // 表单 field 名
        mimeType: 'application/pdf', // mime
      },
      {
        filename: 'test.pdf',        // 文件原名
        data: ReadStream,    // mode 为 stream 时为服务器临时文件地址
        fieldname: 'test2',          // 表单 field 名
        mimeType: 'application/pdf', // mime
      },
      // ...file 下支持同时上传多个文件
    ]

    */
    return serverName;
  }
}
