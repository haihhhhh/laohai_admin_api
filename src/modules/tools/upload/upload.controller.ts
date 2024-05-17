import { BadRequestException, Controller, Post, Req } from '@nestjs/common'
import { ApiBearerAuth, ApiConsumes, ApiOperation, ApiTags } from '@nestjs/swagger'

import { AuthUser } from '@server/modules/auth/decorators/auth-user.decorator'

import { Perm } from '@server/modules/auth/decorators/permission.decorator'

import { FastifyRequest } from 'fastify'

import { UploadService } from './upload.service'

@ApiBearerAuth()
@ApiTags('Tools - 上传模块')
@Controller('upload')
export class UploadController {
  constructor(private uploadService: UploadService) { }

  @Post()
  @ApiOperation({ summary: '上传' })
  @ApiConsumes('multipart/form-data')
  @Perm('upload:upload')
  async upload(@Req() req: FastifyRequest, @AuthUser() user: IAuthUser) {
    const file = await req.file()

    try {
      const path = await this.uploadService.saveFile(file, user.uid)

      return {
        filename: path,
      }
    }
    catch (error) {
      // console.log(error)
      throw new BadRequestException('上传失败')
    }
  }
}
