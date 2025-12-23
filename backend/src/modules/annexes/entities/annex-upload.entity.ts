import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  JoinColumn,
  Unique,
  RelationId,
} from 'typeorm';

import { AnnexTemplate } from './annex-template.entity';
import { EventRequest } from '../../events/entities/event-request.entity';

@Entity({ name: 'annex_upload' })
export class AnnexUpload {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @ManyToOne(() => EventRequest, (req) => req.annexes, {
    onDelete: 'RESTRICT',
    nullable: false,
  })
  @JoinColumn({ name: 'event_request_id' })
  eventRequest!: EventRequest;

  @RelationId((u: AnnexUpload) => u.eventRequest)
  eventRequestId!: string;

  @ManyToOne(() => AnnexTemplate, (template) => template.uploads, {
    onDelete: 'RESTRICT',
    nullable: false,
  })
  @JoinColumn({ name: 'annex_template_id' })
  template!: AnnexTemplate;

  @RelationId((u: AnnexUpload) => u.template)
  annexTemplateId!: string;

  @Column({ name: 'upload_key', type: 'text' })
  uploadKey!: string;

  @Column({ type: 'boolean', default: false })
  validated!: boolean;
}
