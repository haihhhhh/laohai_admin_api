import { ApiProperty } from '@nestjs/swagger'

import { AbstractEntity } from '@server/common/entity/abstract.entity'
import { UserEntity } from '@server/modules/user/entities/user.entity'
import { Column, Entity, JoinColumn, ManyToOne, Relation } from 'typeorm'

@Entity('todo')
export class TodoEntity extends AbstractEntity {
  @Column()
  @ApiProperty({ description: 'todo' })
  value: string

  @ApiProperty({ description: 'todo' })
  @Column({ default: false })
  status: boolean

  @ManyToOne(() => UserEntity)
  @JoinColumn({ name: 'user_id' })
  user: Relation<UserEntity>
}
