import { ApiProperty, IntersectionType, PartialType } from '@nestjs/swagger'
import { PagerDto } from '@server/common/dto/pager.dto'
import { IsString } from 'class-validator'

export class TodoDto {
  @ApiProperty({ description: '名称' })
  @IsString()
  value: string
}

export class TodoUpdateDto extends PartialType(TodoDto) { }

export class TodoQueryDto extends IntersectionType(PagerDto, TodoDto) { }
