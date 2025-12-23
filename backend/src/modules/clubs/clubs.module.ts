import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { ClubsService } from './services/clubs.service';
import { ClubsController } from './controllers/clubs.controller';

import { Club } from './entities/club.entity';
import { ClubLeader } from './entities/club-leader.entity';
import { Subscription } from './entities/subscription.entity';
import { AnnualReport } from './entities/annual-report.entity';
import { Post } from '../community/entities/post.entity';
import { StorageModule } from '../storage/storage.module';
@Module({
  imports: [
    TypeOrmModule.forFeature([
      Club,
      ClubLeader,
      Subscription,
      AnnualReport,
      Post,
    ]),
    StorageModule,
  ],
  controllers: [ClubsController],
  providers: [ClubsService],
  exports: [TypeOrmModule, ClubsService],
})
export class ClubsModule {}
