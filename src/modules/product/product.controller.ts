import {
  Body,
  Controller,
  Delete,
  Get,
  Post,
  Put,
  Query,
  UseGuards,
} from '@nestjs/common'
import { ApiBearerAuth, ApiOperation, ApiTags } from '@nestjs/swagger'

import { ApiResult } from '@server/common/decorators/api-result.decorator'
import { IdParam } from '@server/common/decorators/id-param.decorator'

import { Pagination } from '@server/helper/paginate/pagination'
import { Perm, PermissionMap } from '@server/modules/auth/decorators/permission.decorator'
import { Resource } from '@server/modules/auth/decorators/resource.decorator'

import { ResourceGuard } from '@server/modules/auth/guards/resource.guard'
import { ProductEntity } from '@server/modules/product/product.entity'

import { ProductDto, ProductQueryDto, ProductUpdateDto } from './product.dto'
import { ProductService } from './product.service'

export const permissions: PermissionMap<'product'> = {
  LIST: 'product:list',
  CREATE: 'product:create',
  READ: 'product:read',
  UPDATE: 'product:update',
  DELETE: 'product:delete',
} as const

@ApiTags('Business - Product模块')
@UseGuards(ResourceGuard)
@Controller('product')
@ApiBearerAuth()
export class ProductController {
  constructor(private readonly productService: ProductService) { }

  @Get()
  @ApiOperation({ summary: '获取Product列表' })
  @ApiResult({ type: [ProductEntity] })
  @Perm(permissions.LIST)
  async list(@Query() dto: ProductQueryDto): Promise<Pagination<ProductEntity>> {
    return this.productService.list(dto)
  }

  @Get(':id')
  @ApiOperation({ summary: '获取Product详情' })
  @ApiResult({ type: ProductEntity })
  @Perm(permissions.READ)
  async info(@IdParam() id: number): Promise<ProductEntity> {
    return this.productService.detail(id)
  }

  @Post()
  @ApiOperation({ summary: '创建Product' })
  @Perm(permissions.CREATE)
  async create(@Body() dto: ProductDto): Promise<void> {
    await this.productService.create(dto)
  }

  @Put(':id')
  @ApiOperation({ summary: '更新Product' })
  @Perm(permissions.UPDATE)
  @Resource(ProductEntity)
  async update(
    @IdParam() id: number,
    @Body() dto: ProductUpdateDto,
  ): Promise<void> {
    await this.productService.update(id, dto)
  }

  @Delete(':id')
  @ApiOperation({ summary: '删除Product' })
  @Perm(permissions.DELETE)
  @Resource(ProductEntity)
  async delete(@IdParam() id: number): Promise<void> {
    await this.productService.delete(id)
  }
}
