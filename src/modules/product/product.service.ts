import { Injectable, NotFoundException } from '@nestjs/common'
import { InjectRepository } from '@nestjs/typeorm'

import { paginate } from '@server/helper/paginate'
import { Pagination } from '@server/helper/paginate/pagination'
import { ProductEntity } from '@server/modules/product/product.entity'
import { Repository } from 'typeorm'

import { ProductDto, ProductQueryDto, ProductUpdateDto } from './product.dto'

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(ProductEntity)
    private productRepository: Repository<ProductEntity>,
  ) { }

  async list({
    page,
    pageSize,
  }: ProductQueryDto): Promise<Pagination<ProductEntity>> {
    return paginate(this.productRepository, { page, pageSize })
  }

  async detail(id: number): Promise<ProductEntity> {
    const item = await this.productRepository.findOneBy({ id })
    if (!item)
      throw new NotFoundException('未找到该记录')

    return item
  }

  async create(dto: ProductDto) {
    await this.productRepository.save(dto)
  }

  async update(id: number, dto: ProductUpdateDto) {
    await this.productRepository.update(id, dto)
  }

  async delete(id: number) {
    const item = await this.detail(id)

    await this.productRepository.remove(item)
  }
}
