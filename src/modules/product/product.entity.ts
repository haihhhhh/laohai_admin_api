import { ApiProperty } from '@nestjs/swagger'

import { AbstractEntity } from '@server/common/entity/abstract.entity'
import { Column, Entity } from 'typeorm'

@Entity('product')
export class ProductEntity extends AbstractEntity {
  @Column()
  @ApiProperty({ description: '商品名称' })
  name: string

  @Column()
  @ApiProperty({ description: '商品编码' })
  code: string

  @Column({ nullable: true })
  @ApiProperty({ description: '备注' })
  remark: string
}
