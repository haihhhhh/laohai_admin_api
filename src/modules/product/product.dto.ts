import { ApiProperty, IntersectionType, PartialType } from '@nestjs/swagger'
import { PagerDto } from '@server/common/dto/pager.dto'
import { IsOptional, IsString } from 'class-validator'

export class ProductDto {
  @ApiProperty({ description: '商品名称' })
  @IsString()
  @IsOptional()
  name: string

  @ApiProperty({ description: '商品编码' })
  @IsString()
  @IsOptional()
  code: string

  @ApiProperty({ description: '商品描述' })
  @IsString()
  @IsOptional()
  remark: string
}

export class ProductUpdateDto extends PartialType(ProductDto) { }

export class ProductQueryDto extends IntersectionType(PagerDto<ProductDto>, PartialType(ProductDto)) {
}
