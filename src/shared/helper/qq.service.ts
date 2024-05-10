import { HttpService } from '@nestjs/axios'
import { Injectable } from '@nestjs/common'

@Injectable()
export class QQService {
  constructor(private readonly http: HttpService) {}

  async getNickname(qq: string | number) {
    // const { data } = await this.http.axiosRef.get(
    //   `https://users.qzone.qq.com/fcg-bin/cgi_get_portrait.fcg?uins=${qq}`,
    // )
    // return data
    return '';
  }

  async getAvater(qq: string | number) {
    return `https://q1.qlogo.cn/g?b=qq&s=100&nk=${qq}`
  }
}
