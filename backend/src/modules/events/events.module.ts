import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { EventsService } from './services/events.service';
import { EventsController } from './controllers/events.controller';

import { Event } from './entities/event.entity';
import { EventRequest } from './entities/event-request.entity';
import { Room } from './entities/room.entity';

import { Club } from '../clubs/entities/club.entity';
import { ClubLeader } from '../clubs/entities/club-leader.entity';

import { AnnexTemplate } from '../annexes/entities/annex-template.entity';
import { AnnexUpload } from '../annexes/entities/annex-upload.entity';

import { AnnexesModule } from '../annexes/annexes.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Event,
      EventRequest,
      Room,
      Club,
      ClubLeader,
      AnnexTemplate,
      AnnexUpload,
    ]),
    AnnexesModule,
  ],
  providers: [EventsService],
  controllers: [EventsController],
})
export class EventsModule {}
