import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Post } from './entities/post.entity';
import { CommunityService } from './community.service';
import { CommunityController } from './community.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Post])],
  providers: [CommunityService],
  controllers: [CommunityController],
  exports: [TypeOrmModule],
})
export class CommunityModule {}
