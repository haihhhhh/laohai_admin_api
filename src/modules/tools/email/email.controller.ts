import { Body, Controller, Post } from '@nestjs/common'

import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger'

import { MailerService } from '@server/shared/mailer/mailer.service'

import { EmailSendDto } from './email.dto'

@ApiTags('System - 邮箱模块')
@ApiBearerAuth()
@Controller('email')
export class EmailController {
  constructor(private emailService: MailerService) { }

  @ApiOperation({ summary: '发送邮件' })
  @Post('send')
  async send(@Body() dto: EmailSendDto): Promise<void> {
    const { to, subject, content } = dto
    await this.emailService.send(to, subject, content, 'html')
  }
}
