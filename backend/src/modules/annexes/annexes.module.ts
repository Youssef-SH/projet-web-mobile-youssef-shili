import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AnnexTemplate } from './entities/annex-template.entity';
import { AnnexUpload } from './entities/annex-upload.entity';
import { EventRequest } from 'src/modules/events/entities/event-request.entity';
import { Club } from 'src/modules/clubs/entities/club.entity';
import { AnnexesService } from './services/annexes.service';
import { StorageService } from 'src/modules/storage/storage.service';

@Module({
  imports: [
    TypeOrmModule.forFeature([AnnexTemplate, AnnexUpload, EventRequest, Club]),
  ],
  providers: [AnnexesService, StorageService],
  exports: [AnnexesService],
})
export class AnnexesModule {}
