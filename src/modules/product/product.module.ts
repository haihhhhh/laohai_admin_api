import { Module } from '@nestjs/common'
import { TypeOrmModule } from '@nestjs/typeorm'

import { ProductController } from './product.controller'
import { ProductEntity } from './product.entity'
import { ProductService } from './product.service'

const services = [ProductService]

@Module({
  imports: [TypeOrmModule.forFeature([ProductEntity])],
  controllers: [ProductController],
  providers: [...services],
  exports: [TypeOrmModule, ...services],
})
export class ProductModule {}
