import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  ManyToOne,
  OneToOne,
  OneToMany,
  JoinColumn,
  CreateDateColumn,
  RelationId,
} from 'typeorm';

import { Club } from '../../clubs/entities/club.entity';
import { ClubLeader } from '../../clubs/entities/club-leader.entity';
import { Room } from './room.entity';
import { Event } from './event.entity';
import { AnnexUpload } from 'src/modules/annexes/entities/annex-upload.entity';

import { EventType } from '../entities/enums/event-type.enum';
import { RequestStatus } from '../entities/enums/request-status.enum';

@Entity({ name: 'event_request' })
export class EventRequest {
  @PrimaryGeneratedColumn('uuid')
  id!: string;

  @ManyToOne(() => Club, (club) => club.eventRequests, { onDelete: 'RESTRICT' })
  @JoinColumn({ name: 'club_id' })
  club!: Club;

  @RelationId((r: EventRequest) => r.club)
  clubId!: string;

  @ManyToOne(() => ClubLeader, { onDelete: 'SET NULL', nullable: true })
  @JoinColumn({ name: 'submitted_by_leader_id' })
  submittedByLeader?: ClubLeader | null;

  @RelationId((r: EventRequest) => r.submittedByLeader)
  submittedByLeaderId?: string | null;

  @ManyToOne(() => Room, (room) => room.requests, {
    onDelete: 'RESTRICT',
    nullable: true,
  })
  @JoinColumn({ name: 'room_id' })
  room?: Room | null;

  @RelationId((r: EventRequest) => r.room)
  roomId?: string | null;

  @Column({ name: 'external_address', type: 'text', nullable: true })
  externalAddress?: string | null;

  @Column({ type: 'text' })
  title!: string;

  @Column({ type: 'text', nullable: true })
  description?: string | null;

  @Column({
    name: 'event_type',
    type: 'enum',
    enum: EventType,
    enumName: 'event_type',
  })
  eventType!: EventType;

  @Column({ name: 'start_time', type: 'timestamptz' })
  startTime!: Date;

  @Column({ name: 'end_time', type: 'timestamptz' })
  endTime!: Date;

  @Column({ name: 'expected_students', type: 'int', nullable: true })
  expectedStudents?: number | null;

  @Column({
    type: 'enum',
    enum: RequestStatus,
    enumName: 'request_status',
    default: RequestStatus.PENDING,
  })
  status!: RequestStatus;

  @Column({ name: 'admin_comment', type: 'text', nullable: true })
  adminComment?: string | null;

  @CreateDateColumn({ name: 'submitted_at', type: 'timestamptz' })
  submittedAt!: Date;

  @Column({
    name: 'required_annex_template_ids',
    type: 'uuid',
    array: true,
    default: () => 'ARRAY[]::uuid[]',
  })
  requiredAnnexTemplateIds!: string[];

  @OneToOne(() => Event, (event) => event.request)
  event?: Event;

  @OneToMany(() => AnnexUpload, (upload) => upload.eventRequest)
  annexes!: AnnexUpload[];
}
